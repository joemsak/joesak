require 'rack/rewrite'

use Rack::Static,
  :urls => ["/css", "/js", "/img",
            "/robots.txt", "/humans.txt", "/favicon.ico"],
  :root => "public",
  :index => "index.html",
  :header_rules => [
    [:all, {'Cache-Control' => 'public, max-age=86400'}]
  ]

use Rack::Rewrite do
  r301 %r{/post/(.+)$},
       'http://joemsak.tumblr.com/post/$1'
end

run lambda { |env|
  [
    404,
    { 'Content-Type'  => 'text/html' },
    File.open('public/404.html')
  ]
}
