class Multimap
	include Enumerable
	def initialize
		@map = {}
	end

	def each &block
		@map.each_value do |x|
			x.each {|y| block.call(y)}
		end
	end

	def size
		count
	end

	def put(key, *value)
		raise ArgumentError.new("No values sent") if (value.count == 0)
		@map[key] = [] if !@map.has_key? key
		value.each {|x| @map[key] << x}
	end
	alias []= put

	def get(key)
		raise ArgumentError.new("Don't have key #{key}") if !has_key?(key)
		@map[key]
	end
	alias [] get

	def has_key? key
		@map.has_key? key
	end

	alias has_value? include?

	def remove (key, elem=nil)
		if (!has_key?(key) || (!elem.nil? && !@map[key].include?(elem))) 
			raise ArgumentError.new("Don't have key or key associated to the element")
		elem.nil? ? @map.delete(key) : @map[key].delete(elem)
		end
	end
end

multimap = Multimap.new
multimap.put("saludo", "hola")
multimap.put("saludo", "hla")
multimap.put("idioma", "ingles")
multimap.put("idioma", "ingls")
puts multimap.has_key?("saludo")
multimap.remove("saludo")
multimap.each {|x| puts x}