module Iterable
		def iterator_start
			@__current = 0
		end

		def iterator_has_next?
			size >= (@__current + 1)
		end

		def iterator_next
			if !iterator_has_next? then
				return nil
			else 
			elem = at(@__current)
			@__current += 1
			elem
			end
		end

	end