require_relative 'iterable.rb'

class Interval
	include Iterable
	attr_accessor :first, :last, :step
	def initialize(first, last, step=1)
		raise ArgumentError.new("Step mustn't be zero") if step == 0
		raise ArgumentError.new("Last must be larger than first") if first > last
	
		@first = first
		@last = last
		@step = step
	end

	def size
		((@last - @first) / @step).ceil
	end

	def at(idx)
		raise ArgumentError.new("Out of bounds") if idx > size
		@first + step*idx
	end

end



i = Interval.new(-10,10.9,0.5)
puts i.iterator_start
while i.iterator_has_next?
	puts i.iterator_next
end