require 'test/unit'
require 'rack/test'

OUTER_APP = Rack::Builder.parse_file(File.expand_path('../config.ru', __FILE__)).first

class TestApp < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    OUTER_APP
  end

  def test_js_and_css

    # url => expected result
    {
      '/yui?js/dir1/file1.js&js/dir2/file2.js' => "public/js/dir1/file1.js\n\npublic/js/dir2/file2.js\n",
      '/yui?css/dir1/file1.css&css/dir1/file2.css&css/dir2/file1.css' => <<-EOF
public/css/dir1/file1.css

public/css/dir1/file2.css

public/css/dir2/file1.css
span.avatar  { background-image: url(/assets/css/dir2/avatar.png) }
span.avatar2 { background-image: url(/assets/css/dir2/avatar2.png) }
span.avatar3 { width: 50px; background-image: url(/assets/css/dir2/avatar3.png); height: 50px; }
span.spacer  { background-image: url('data:image/jpeg;base64,R0lGODlhAQABAID/AMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAEBMgA7') }
EOF
    }.each_pair { |url, expected_body|

      # request for the first time
      get url

      resp = last_response

      assert_equal 200, resp.status
      assert_equal expected_body, resp.body

      last_modified = resp.header["Last-Modified"]

      # request again with "If-Modified-Since" header (content not changed => "304 Not Modified")
      get url, {}, { "HTTP_IF_MODIFIED_SINCE" => last_modified }

      assert_equal 304, last_response.status

    }

  end

end