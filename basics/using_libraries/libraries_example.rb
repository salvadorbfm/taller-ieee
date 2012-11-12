require 'open-uri'

open("http://www.ingenierias.ugto.mx") do |f|
  f.each_line {|line|  p line}
  puts "base_uri:" + f.base_uri.to_s
  puts "content_type:" + f.content_type.to_s
  puts "charset:" + f.charset.to_s
  puts "content_encoding:" + f.content_encoding.to_s
  puts "last_modified:" + f.last_modified.to_s
end