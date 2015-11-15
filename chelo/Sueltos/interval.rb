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
		((@last - @first) / @step) + 1
	end

	def at(idx)
		raise ArgumentError.new("Out of bounds") if idx > size
		@first + step*idx
	end

	def each
		curr = 0
		while curr < size
			yield(at(curr))
			curr += 1
		end
	end

	def findFirst
		curr = 0
		found = false
		a = nil
		while(!found && curr < size)
			a = at(curr)
			found = yield(a)
			curr += 1
		end
		a
	end


	def findAll
		found = []
		curr = 0
		while(curr < size)
			a = at(curr)
			found << a if yield(a)
			curr += 1
		end
		found
	end

	def fold(ini)
		acum = ini
		each{ |x| acum = yield(acum, x) }
		acum
	end

	def map
		_map = []
		each {|x| _map << yield(x)}
		_map
	end

end



i = Interval.new(1,15,1)
a = i.fold(0){|a,b| a+b}
b = i.map{|a| 2*a}
puts a
print b
puts