# el del parcial
Integer.class_eval do
	def iter
		self.downto(1) {|x| yield x}
	endd
end

5.iter do |x|
	puts x * 10
end

# boludeces
class Person
	def initialize(name)
		@name = name
	end
end

person = Person.new("John")

person.instance_eval do
	def name
		@name
	end
end

puts person.name
