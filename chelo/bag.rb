class Bag
	include Enumerable

	def initialize()
		@bag = {}
	end

	def add(elem)
		if(@bag.has_key?elem)
			@bag[elem] = @bag[elem] + 1
		else
			@bag[elem] = 1
		end
	end

	def each
		@bag.each do |key, value|
			count = 0
			while count < value
				yield(key)
				count+=1
			end
		end
	end
end


bag = Bag.new
bag.add("hola")
bag.add("hola")

bag.each {|x| puts x}