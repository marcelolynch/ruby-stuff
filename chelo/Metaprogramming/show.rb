require '../contador'

class Spy
	def self.show(obj)
		puts obj.class

		puts "Instance variables:"
		obj.instance_variables.each do |var|
			value = obj.instance_variable_get(var)
			puts "\t #{var.to_s}:  #{value.to_s}"\
			+ " (#{value.class})"
		end
	end
end

contador = Contador.new
Spy.show(contador)
contador.increment
Spy.show(contador)