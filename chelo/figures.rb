module Figures
	require 'set'

	class Figure
		def perimeter
			raise NotImplementedError.new("Must implement perimeter")
		end

		def to_s
			"Generic figure"
		end
	end


	class Triangle < Figure
		attr_reader :sides
	
		def initialize(side1, side2, side3)
			@sides = [side1,side2,side3]
		end

		def perimeter
			@sides.reduce(:+)
		end

		def area
			s = perimeter / 2.0
			(s*( s - @sides[0] )*( s - @sides[1] )*( s - @sides[2])) ** 0.5
		end

		def ==(other)
			sides.to_set == other.sides.to_set
		end
	end

	class Rectangle < Figure
		attr_reader :width, :height
		def initialize(width, height)
			@width = width.to_f
			@height = height.to_f
		end

		def perimeter
			@width*2 + @height * 2
		end

		def area
			@width*@height
		end

		def diagonal
			(@width**2 + @height**2)**0.5
		end

		def ==(other)
			other.instance_of?(self.class) && (@width == other.width) && (@height == other.height)
		end

		def eql?(other)
			self == other
		end
	end


	class Square < Rectangle
		def initialize(side)
			super(side,side)
		end
	end
end

r1 = Figures::Rectangle.new(4,4)
r2 = Figures::Square.new(4)

t1 = Figures::Triangle.new(1,2,3)
t2 = Figures::Triangle.new(3,2,1)

puts t1 == t2
puts r1.eql?r2