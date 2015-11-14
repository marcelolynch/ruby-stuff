require './iterable.rb'
require './ArrayList'
class Interval
	include Iterable
	include Enumerable
	attr_accessor :first, :last, :step

	def initialize(first, last, step)
		@first = first
		@last = last
		@step = step
	end

	def at(pos)
		@first + pos * @step
	end

	def size
		(@last - @first) / @step + 1
	end

	def each
		current = @first
		while current <= @last
			yield current
			current += @step
		end
	end

	def findFirst (&block)
	current = @first
	until block.call(current) == true || current > @last
		current += @step
	end
	if (current > @last)
		raise ArgumentError("No se encontraron elementos")
	end
	current
	end
	
	def findAll (&block)
		arr = []
		current = @first
		until current > @last do
		arr << current if block.call(current)
		current += @step 
		end
		arr
	end

	def fold(initial=0, &block)
		acum = initial
		each {|x| acum = block.call(acum, x)}
		acum
	end

	def map (&block)
		arr = []
		each {|x| arr << block.call(x)}
		arr
	end
end

# puts [1,2,3]
# int = Interval.new(0,1,0.1)
# puts int.fold{ | acum, x | acum + Math.sqrt(1-x*x)} * 4
# arreglo = int.map{|x| x*10}
# arr= int.findAll{|x| x>0}
# puts arr.to_s
# puts int.count == int.size


