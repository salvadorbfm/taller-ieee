
# Salvador Elizarraras Montenegro
# This is a simple example of OO in Ruby
# This is a simple modeling of Rogue Class based on Dragon Age Origins ;)


class Rogue
	#attr_accessor
	attr_reader :name, :gender
	attr_reader :dextery, :cunning, :strength, :magic

	def initialize(name, gender)
		@name = name
		@gender = gender
		@strength = 10
		@dextery = 14
		@magic = 10
		@cunning = 14
	end

	# 
	def name=(new_name)
		@name = new_name if new_name < 24
	end

	def gender=(new_gender)
		new_gender.downcase
		@gender = new_gender if new_gender == "male" || new_gender == "female"
	end

	# More methods
	def attack_with_backstab?(target)
		#For this case, we don't know what is target, it may be other class
		if target.methods.include?(:is_backstable) == false
			puts "You lazy!... Please implement is_backstable for your target..."
			return false
		end

		if target.is_backstable?() == false
			return false
		end

		factor = target.defense * (@dextery + @cunning)/100.0 
		if  factor > 50.0
			return true
		else
			return false 
		end
	end

	def say_hi
		puts "Hi!, I'm #{@name}... I'm a rogue"
	end

end


class Assassin < Rogue

	def attack_with_backstab?(target)
		# TODO: Some special stuff for assassins...
		say_hi
		super
	end

	def say_hi
		super
		puts "Well... I'm an assasin"
	end
end



rogue_a = Rogue.new("Aria","female")
rogue_b = Rogue.new("Letharis","male")
assasin = Assassin.new("Leia", "female")


puts "-" * 20
puts "Backstab!: " + rogue_a.attack_with_backstab?(rogue_b).to_s
puts "-" * 20

puts "-" * 20
puts "== == Let's print the state == =="
p rogue_a
p rogue_b
p assasin
puts "-" * 20

puts "-" * 20
puts " == == Saying hi! == =="
rogue_a.say_hi
assasin.say_hi()  # Remember, this is the same than above
puts "-" * 20

puts "== == More about inheritance == =="
assasin.attack_with_backstab?(rogue_b)


# Just being a gentleman with the terminal
puts ""
puts ""
