class Mock
	def initialize(target = nil)
		@returnables = {}
		@called = {}
		@target = target
	end

	def _when(sym, args=[], ret_value)
		sym = sym.to_sym
		@returnables[sym] = {args => ret_value}
	end

	def method_missing(m, *args)
		sym = m.to_sym #por las dudas
		ret_value = nil

		if not @returnables.has_key?(sym) 
			#No existe el metodo en el mock
			if @target.nil? then					
				raise NoMethodError.new 
			else
				ret_value = @target.call(sym, *args) #Puede tirar error
				add_called(sym)
			end
		elsif not @returnables[sym].has_key?(args)
			#Existe el metodo pero no con esos argumentos
			if @target.nil? then
				raise ArgumentError.new
			else
				ret_value = @target.call(sym, *args) #Puede tirar error
				add_called(sym) 
			end
		else
			add_called(sym)
			ret_value = @returnables[sym][args]
		end

		ret_value
	end

	private
	def add_called(sym)
		if @called.has_key?(sym)
			@called[sym] += 1
		else
			@called[sym] = 0
		end
	end

end

mock = Mock.new
mock._when(:at, [0], 1)
mock._when(:size, [], 10)

list = mock
puts list.at(0)
puts list.size