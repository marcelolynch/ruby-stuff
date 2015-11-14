class Stack
	include Enumerable
	def initialize
		@array = []
	end

	def empty?
		@array.empty?
	end

	def push elem
		@array << elem
	end

	def pop
		raise ArgumentError.new("Empty stack") if empty?
		@array.pop
	end

	def each
		@array.each {|x| yield x}
	end
	alias size count

	def to_s
		@array.to_s
	end
	alias inspect to_s
end

def reverse_msg msg
	stack = Stack.new
	msg.split(/ /).each {|x| stack.push x}
	str = []
	str << stack.pop while !stack.empty?
	str * " "
end

def reverse_msg2 msg
	stack = Stack.new
	msg.split(/ /).each {|x| stack.push x}
	str = ""
	str << (stack.pop + " ") while !stack.empty?
	str
end


puts reverse_msg2 "   piña    como va"