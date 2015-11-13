class Contador
	attr_reader :value, :start, :inc
	def initialize(start=0, increment=1)
		@start = start
		@value = start
		@inc = increment
	end

	def increment
		@value += @increment
	end

	def ==(other)
		(@start == other.start)\
		&& (@inc == other.inc)\
		&& (@value == other.value)
	end

	def eql?(other)
		self == other
	end

end


c = Contador.new
cc = Contador.new

puts c.eql?cc
