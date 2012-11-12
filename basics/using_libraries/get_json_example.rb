require 'net/http'
require 'open-uri'
require 'json'

elements = Hash.new
reddit_url = "http://www.reddit.com/r/fun.json"
resp = Net::HTTP.get_response(URI.parse(reddit_url))
data = resp.body
result = JSON.parse(data)



result.each do |key, value|
	puts "-- " + key.to_s
	puts value.to_s
end

puts "**" * 10

#puts result["data"]["children"].class

result["data"]["children"].each do |x|
	x.each do |key, value|
		elements[value["title"]] = value["url"];
	end
end

=begin
elements.to_a.last(5).each do |key,value|
	puts "Saving " + key.to_s
	puts "Path: " + File.basename(value.to_s)
	File.open(key.to_s.split(" ")[0],'wb'){ |f| f.write(open(value.to_s).read) }

end
=end






