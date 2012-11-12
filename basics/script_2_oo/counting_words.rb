

# Salvador Elizarraras Montenegro
# This is a comment
# Ruby-Taller
# Scripting style

filename = "tex2.txt"
text_array = Array.new
words_hash = Hash.new("Counting words...")

# Get every word from the file
if File.exists?(filename)  # Checks if
	File.foreach(filename) do |line|
		if line =~ /\S/
			line.split(%r{\W}).each do |x|
				text_array << x.to_s.downcase if x.length > 0
			end
		end
	end
else
	puts "Cannot open the file!"
end

# Printing the whole text_array
puts "*" * 20
puts text_array.to_s
puts "*" * 20

# Counting the words, easy stuff with a hash map
text_array.each do |x|
	if words_hash.has_key?(x) == false
		words_hash[x] = 1;
	else
		words_hash[x] += 1;
	end
end

# Sorting the word list by count
words_hash = words_hash.sort_by{|word, count| count}

# A simple top 10
puts "---Top 10---"
words_hash.last(10).reverse.each do |word, count|
	puts "#{word}:#{count}"
end