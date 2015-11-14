class Proxy
	def initialize (o)
		@object = o
		@methods = {}
		@object.public_methods.each do |m|
			@methods[m.to_sym] = 0
		end
	end

	def _called?(method)
		@methods[method.to_sym] != 0
	end

	def _times?(method)
		@methods[method.to_sym]
	end

	def method_missing(m, *args, &block)
		@object.public_send(m.to_sym, *args, &block)
		@methods[m.to_sym] += 1
	end
end

algo = Proxy.new("hola")
nuevo = algo.sub(/hol/, "medi")
puts nuevo
puts algo._called? "sub"
