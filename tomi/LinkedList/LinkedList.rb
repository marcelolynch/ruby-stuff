class LinkedList
	include Enumerable

	def initialize
		@head = nil
	end

	def empty?
		@head.nil?
	end

	def add (elem)
		new = Node.new(elem)
		if empty?
			@head = new
		else
			last_node.next = new
		end
	end

	def remove (elem)
		@head = @head.remove(elem)
	end

	def each
		node = @head
		while !node.nil?
			yield node.element
			node = node.next
		end
	end

	def [](index)
		return nil if (index < 0 || index >= count)
		node_in(index).element
	end

	def []=(index, element)
		return nil if (index < 0 || index > count)
		if index == count
			add(element)
		else
			node_in(index).element = element
		end
	end

	def last
		self[count-1]
	end

	private

	def node_in (index)
		node = @head
		index.times {node = node.next}
		node
	end

	def last_node
		node_in(count-1)
	end

	class Node
		attr_accessor :next
		attr_accessor :element

		def initialize(elem = nil)
			@element = elem
			@next = nil
		end

		def remove(elem)
			if elem == @element
				return @next
			elsif !@next.nil?
				@next = @next.remove(elem)
			end

			self
		end
	end
end
