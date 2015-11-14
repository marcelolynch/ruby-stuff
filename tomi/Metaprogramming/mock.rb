# dudo mucho que se haga asi. basicamente @methods es un mapa {metodo => parametros => resultado}
class Mock
	def initialize(target = nil)
		@target = target
		@methods = {}
		@methods_calls = {}
	end

	def method_missing(m, *args, &block)
		if @methods.has_key? m.to_sym
			method = @methods[m.to_sym]
			@methods_calls[m.to_sym] += 1
			method[args]
		else
			@target.send(m, *args, &block)
		end
	end

	def _when(m, args, result)
		if !@methods.has_key? m.to_sym
			@methods[m.to_sym] = {args => result}
			@methods_calls[m.to_sym] = 0
		else
			@methods[m.to_sym][args] = result
		end
	end

	def _called?(m)
		_times?(m) != 0
	end

	def _times?(m)
		@methods_calls[m.to_sym]
	end
end

list = Mock.new
list._when("size", [], 0)
list._when("size", [1], 1)
puts list.size 1
puts list._times? "asd"
