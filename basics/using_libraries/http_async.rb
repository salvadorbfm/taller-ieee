require "net/http"
require "uri"

Thread.new do
  uri = URI.parse("http://google.com/")
  http = Net::HTTP.new(uri.host, uri.port)
  response = http.request(Net::HTTP::Get.new(uri.request_uri))
  puts "1"
  puts response.body
end.join

Thread.new do
  uri = URI.parse("http://yahoo.com/")
  http = Net::HTTP.new(uri.host, uri.port)
  response = http.request(Net::HTTP::Get.new(uri.request_uri))
  puts "2"
  puts response.body
end.join



puts "Hebreando hebreando"