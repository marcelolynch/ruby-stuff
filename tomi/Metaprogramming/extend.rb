module Greeter
	def hi
		puts "hi"
	end
end

String.extend Greeter
String.hi # => hi
# "hola".hi => Undefined method ERROR
str = "hola"
str.extend Greeter
str.hi # => hi
puts str # => hola
