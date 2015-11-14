class Counter
	attr_reader :value
	attr_accessor :initial

	def initialize(initial=0)
		@initial = initial
		@value = initial
	end

	def increment
		@value += 1
	end

	def reset
		@value = @initial
	end

	def == (other)
		return @initial == other.initial && @value == other.value
	end

	alias eql? ==
	alias === ==

end

counter = Counter.new
counter.increment
puts counter.value
