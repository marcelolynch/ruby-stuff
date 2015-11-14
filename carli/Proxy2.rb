require './Counter.rb'

class Proxy

	def initialize(counter)
		@counter = counter
		@method = {}
	end

	def method_missing(method, *args, &block)
		if @method.include?(method)
			@method[method] += 1
		else 
			@method[method] = 1
		end
		@counter.send(method, *args,&block)
	end

	def _called?(method)
		_times(method) != 0
	end

	def _times(method)
		if @method.include?(method)
			@method[method]
		else
			0
		end
	end

end

counter = Proxy.new(Counter.new)
counter.increment
counter.increment
counter.count
puts counter._called?(:increment)
puts counter._times(:increment)


