require 'rack'
require 'time'

module YuiComboLoader

  class Middleware

    def initialize(app, options = nil)
      @app   = app
      @cache = Rack::ConditionalGet.new(lambda { |env| self.combo_response(env) })

      unless options.nil?
        config = YuiComboLoader.configuration
        options.each do |k,v| 
          config.send("#{k}=", v)
        end
      end
    end

    def call(env)
      request = Rack::Request.new(env)
      path    = YuiComboLoader.configuration.combo_path

      if !path || path == request.path
        return @cache.call(env)
      else
        return @app.call(env)
      end
      
    end

    def combo_response(env)
      request = Rack::Request.new(env)

      # The list of files to combine
      paths = files_to_combine(request)

      # Is it a CSS combo request
      is_css = request.query_string.include? '.css'

      headers = {
        'Last-Modified' =>  last_modified_for(paths).httpdate,
        'Content-Type'  => (is_css ? 'text/css' : 'application/javascript'),
        'Cache-Control' => 'max-age=0, private, must-revalidate'
      }

      body = defer {
        concat(paths, is_css)
      }

      [200, headers, body]
    end

    private

    def defer(&block)
      def block.each ; yield call ; end
      block
    end

    def files_to_combine(request)
      request.params.map do |p|
        YuiComboLoader.configuration.public_base + (p[0].gsub('..', '')) 
      end.delete_if do |p|
        !File.readable?(YuiComboLoader.configuration.public_root + p) 
      end
    end

    def last_modified_for(paths)
      paths.map { |p| File.mtime(YuiComboLoader.configuration.public_root + p) }.max || Time.now
    end

    def concat(paths, is_css)
      output = []
      paths.each do |file|
        data = File.new(YuiComboLoader.configuration.public_root + file).gets(nil)
        # Fix CSS Assets path (Cf https://github.com/neyric/express-yuicombo/blob/master/lib/express-yuicombo.js)
        if is_css
          resource_base = File.dirname(file)
          data.gsub!(/url\(\s*["']?(?!data:)(?!\/)([^"'\)]+)["']?\s*\)/, "url("+resource_base+'/\1)')
        end
        output << data
      end
      output.join("\n")
    end

  end
end

