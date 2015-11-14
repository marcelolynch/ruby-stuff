class Algo
	attr_accessor :a, :b, :c
	def initialize(a, b, c)
		@a = Otro.new(a, a, a)
		@b = b
		@c = c
	end
end

class Otro
	def initialize(x, y, z)
		@x = OtroMas.new(x, y, z)
		@y = y
		@z = z
	end

	def to_s
		"Soy Otro"
	end
end

class OtroMas
	def initialize(x, y, z)
		@x = x
		@y = y
		@z = z
	end

	def to_s
		"Soy OtroMas"
	end
end


def show(object, tabs=0)
	t = "\t" * tabs
	object.instance_variables.each do |var|
		name = var.slice(1, var.length) # le saca el @ inicial
		value = object.instance_variable_get(var)
		type = value.class
		puts t + "#{name}: #{type} (#{value})"
		show(value, tabs+1)
	end
end

algo = Algo.new(1, 2, 3)

show(algo)
