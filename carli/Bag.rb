class Bag
	include Enumerable
	def initialize
		@hash = {}
	end

	def each &block
		@hash.each_key {|key| block.call key}
	end

	def size
		@hash.values.reduce(0) {|sum, x| sum + x}
	end

	def add (elem, cant = 1)
		@hash.has_key?(elem) ? @hash[elem] += cant : @hash[elem] = cant
	end

	def include? (elem, cant=1)
		how_many(elem) >= cant
	end

	def how_many elem
		@hash.has_key?(elem) ? @hash[elem] : 0
	end

	def remove (elem, cant=1)
		raise ArgumentError.new("Don't have so many #{elem}") if (!include?(elem, cant))
		@hash[elem] == cant ? remove_all(elem) : @hash[elem] -= cant
	end

	def remove_all elem
		raise ArgumentError.new("Don't have #{elem}") if !include? elem 
		@hash.delete elem
	end
end

bag = Bag.new
bag.add("caramlos", 5)
bag.add("caramelos", 3)
puts bag.include? "caramelos"
bag.remove_all "caramlos"
puts bag.how_many "caramelos"
bag.remove "caramelos", 1
puts bag.size