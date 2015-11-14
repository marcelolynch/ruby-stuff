require_relative "iterable.rb"

class AbstractList
	include Enumerable
	include Iterable

	def each
		raise NotImplementedError.new
	end

	def fold(ini)
		each {|x| ini = yield(ini, x) }
		ini
	end

	def map
		result = []
		each {|x| result << yield(x)}

		result
	end

	def size
		raise NotImplementedError.new
	end

	def empty?
		size == 0
	end


end


class ArrayList < AbstractList

	def initialize
	@arr = Array.new
	end
	
	def add(obj)
		@arr << obj
	end

	def remove_at(idx)
		@arr.delete_at(idx)
	end

	def size
		@arr.length
	end

	def at(idx)
		@arr[idx]
	end

	def each(&block)
		@arr.each &block
	end
end


class LinkedList < AbstractList
	attr_reader :size
	
	class Node
		attr_accessor :next, :elem

		def initialize(obj=nil)
			@elem = obj
			@next = nil
		end
	end

	def initialize
	 	@first = nil
	 	@last = nil
	 	@size = 0
	end

	def add(obj)
		if(@first.nil?)
			@first = Node.new(obj)
			@last = @first
		else
			@last.next = Node.new(obj)
			@last = @last.next
		end
		
		@size += 1
		
		obj
	end

	def at(idx)
		if idx >= @size
			return nil
		end
		curr = @first
		(0...idx).each do
			curr = curr.next #avanzo
		end

		curr.elem
	end

	def remove_at(idx)
		if idx >= size
			return nil
		end
		
		curr = @first
		(0...(idx-1)).each do
			curr = curr.next #avanzo
		end

		elem = curr.next.elem
		curr.next = curr.next.next
		
		@size -= 1

		elem
	end

	def each
		curr = @first
		while !curr.nil? do
			yield(curr.elem)
			curr = curr.next
		end
	end
end


#myList = LinkedList.new

#myList.add(0)
#myList.add(1)
#myList.add(2)
#myList.add(3)
#myList.add(4)
#myList.add(5)
#myList.add(6)

#print myList.fold(0){|x,y| x = 2*y}

#i = myList
#i.iterator_start
#while i.iterator_has_next?
#	puts i.iterator_next
#end