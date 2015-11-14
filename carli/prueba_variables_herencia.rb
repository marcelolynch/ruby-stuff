class Otro
	def initialize(a)
		@a = a
	end

	def to_s
		@a.to_s
	end

	def nada
		@a += 1
	end
end

class OtroMas < Otro
	def initialize(b)
		@a = b
		@b = b
		super(-1)
	end

	def to_s
		mas_nada
		super + ", " + @a.to_s
	end

	def mas_nada
		@a -= 1
	end
end

var = OtroMas.new(4)
puts var