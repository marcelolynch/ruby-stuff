module Complejos

	attr_reader :realPart, :imPart

	def modulus
		(realPart**2 + imPart**2)**0.5
	end

end


class ComplexNum
	include Complejos

	def initialize(re, im=0)
		@realPart = re
		@imPart = im
	end

	def complexify
		self
	end

	def +(other)
		c = other.complexify
		ComplexNum.new(@realPart + c.realPart,\
			@imPart + c.imPart)
	end

	def -(other)
		self+(-other)
	end

	def +@
		self
	end

	def -@
		ComplexNum.new(-@realPart, -@imPart)
	end

	def to_s
		"#{@realPart} + #{@imPart}i"
	end

end

class Fixnum
	def complexify
		ComplexNum.new(self, 0)
	end

	def -(other)
		other + -self
	end

	def +(other)
		other + self
	end
end

z1 = ComplexNum.new(2,2)
z2 = ComplexNum.new(1,1)

puts z1 + z2
puts z1 - z2
puts z1 + 6.0
puts 6 + z1