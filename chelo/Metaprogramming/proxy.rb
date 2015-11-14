require '../contador'

class Proxy
	def initialize(proxied)
		@proxied = proxied
		@called = {}
	end

	def method_missing(method_sym, *args, &block)
		ret_value = @proxied.send(method_sym, *args, &block) #Si pincha, pincha aca
		add_called(method_sym)
		ret_value	
	end

	def _called?(method_sym)
		@called.has_key?(method_sym)
	end

	def _times(method_sym)
		_called?(method_sym) ? @called[method_sym] : 0
	end

	private
		def add_called(sym)
			if @called.has_key?(sym)
				@called[sym] += 1
			else
				@called[sym] = 1
			end
		end
end


counter = Proxy.new(Contador.new)
counter.increment
counter.increment
puts counter.value
puts counter._called?(:increment)
puts counter._times(:increment)