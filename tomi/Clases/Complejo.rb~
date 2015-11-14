# lo que queda implementar es más de lo mismo
class Complejo
	attr_reader :real, :imag
	alias imaginary imag
	def initialize(real=0, imag=0)
		@real = real
		@imag = imag
	end

	def -@
		Complejo.new(-@real, -@imag)
	end

	def + (other)
		r, i = other.real, other.imag
		Complejo.new(@real + r, @imag + i)
	end

	def - (other)
		self + (-other)
	end

	def arg
		Math.atan2(@imag, @real)
	end
	alias phase arg

	def conjugate
		Complejo.new(@real, -@imag)
	end
	alias conj conjugate

	def == (other)
		other.imag == @imag && other.real == @real
	end
	alias === ==

	def to_s
		"(#{@real}#{"+" if @imag >= 0}#{@imag}i)"
	end
end

c = Complejo.new(1, 2)

puts (c - 1).conjugate
