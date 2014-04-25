$LOAD_PATH << File.expand_path('../../lib', __FILE__)

require 'yui_combo_loader'

app = Rack::Builder.new do

   map '/yui' do
      use YuiComboLoader::Middleware, {
         combo_path:  nil,
         public_base: '/assets/',
         public_root: File.join(File.dirname(__FILE__), 'public')
      }
   end

   run lambda { |env| [200, {'Content-Type' => 'text/plain'}, ['hello world']] }
end

use Rack::ShowExceptions

run app

