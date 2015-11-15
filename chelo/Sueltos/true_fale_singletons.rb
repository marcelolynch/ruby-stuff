require 'singleton'

class False
include Singleton

	def or(other)
		other
	end

	def and(other)
		self
	end

	def not
		True.instance
	end

	def xor(other)
		if(other == True.instance)
			other
		else
			self
		end
	end

	def to_s
		"False"
	end


	def inspect
		to_s
	end
end


class True
	include Singleton
	def or(other)
		self
	end

	def and(oter)
		other
	end

	def xor(other)
		if(other = False.instance)
			self
		else
			other
		end
	end

	def not
		False.instance
	end

	def to_s
		"True"
	end

	def inspect
		to_s
	end
end

falso = False.instance
verdadero = True.instance

puts falso.or(verdadero)
puts falso.xor(verdadero)
puts verdadero.not