require 'net/http'
require 'open-uri'
require 'json'

elements = Hash.new
reddit_url = "http://www.reddit.com/r/pics.json"
resp = Net::HTTP.get_response(URI.parse(reddit_url))
data = resp.body
result = JSON.parse(data)


# Iterating through the JSON
result["data"]["children"].each do |x|
	x.each do |key, value|
		elements[value["title"]] = value["url"] if value["title"] && value["url"]
	end
end

# "Title and url from elements hash"
puts "*" * 10
puts elements
puts "*" * 10

elements.to_a.last(20).each do |key,value|
	# This is temporary...
	next if File.extname(value.to_s) == ""
	# Getting basename from url
	basename = File.basename(value.to_s).chomp()
	puts "Saving " + key.to_s
	puts "Path: " + basename
	# Open 
	File.open("images/" + basename,'wb'){ |f| f.write(open(value.to_s).read) }
end







