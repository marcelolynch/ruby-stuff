class Interprete
	def initialize
		@instructions = ""
	end

	def add(str_instruction)
		@instructions << str_instruction
		@instructions << "; "
	end 

	def execute
		eval(@instructions)
	end

	def clear
		@instructions = ""
	end

	defs value(x)
		eval(@instructions + "; #{x}")
	end
end

interprete = Interprete.new
interprete.add("a = [1,2,3]")
interprete.add('a.each do |x|')
interprete.add("puts x")
interprete.add("end")
interprete.execute
