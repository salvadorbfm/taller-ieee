puts "------------------------------------------"
puts 'This is a "Good First Program"'    # Using single quote
# Formatting text...
puts "length:" + textArray.length.to_s
puts "Is length larger than %d? %s" % [9, textArray.length > 9]
puts "Our object is type of #{textArray.class}"
# We can use print instead of puts and it will work in different way
print "How many times do you want to print FIMEE?"
times = gets.chomp();
# We need convert it to int otherwise we will fail
puts "FIMEE " * times.to_i
# We can use document sintax...
puts <<DOCUMENT
\nSome people used to write FIMME instead of FIMEE, 
but that is another story.
DOCUMENT
puts "------------------------------------------"