module Iterable
	def iterator_start
		@_current = 0
	end

	def iterator_has_next
		@_current < size
	end

	def iterator_next
		elem = at(@_current)
		@_current += 1
		elem
	end
end