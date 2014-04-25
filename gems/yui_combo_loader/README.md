# YUI Combo Loader

## Run the test suite

ruby -Itest test/yui_combo_loader_test.rb

## Manual testing

First shell:
```
$> cd test
$> rackup config.ru
```

Other shell:
```
$> curl -v http://localhost:9292/yui\?js/dir1/file1.js\&js/dir2/file2.js # note the value of the Last-Modified header
$> curl -v http://localhost:9292/yui\?js/dir1/file1.js\&js/dir2/file2.js --header "If-Modified-Since: Thu, 24 Apr 2014 16:45:09 GMT"
$> curl -v http://localhost:9292/yui\?css/dir1/file1.css\&css/dir1/file2.css\&css/dir2/file1.css # note the value of the Last-Modified header
$> curl -v http://localhost:9292/yui\?css/dir1/file1.css\&css/dir1/file2.css\&css/dir2/file1.css --header "If-Modified-Since: Thu, 24 Apr 2014 16:45:09 GMT"
```
