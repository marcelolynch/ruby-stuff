class MySet
	include Enumerable
	SIZE = 5

	def initialize
		@hash = []
		0.upto(SIZE-1) {|x| @hash[x] = []}
	end

	def each
		@hash.each do |array|
			array.each {|x| yield x}
		end
	end

	def add *elems
		elems.each do |x|
			array = get_array x
			array << x unless array.include? x
		end
	end

	def include? elem
		array = get_array elem
		array.include? elem
	end

	def remove elem
		array = get_array elem
		array.delete elem
	end

	def to_s
		str = "{"
		each {|x| str = str + x.to_s}
		str = str + "}"
		str
	end

	private
	def get_array elem
		index = elem.hash % SIZE
		@hash[index]
	end
end

set = MySet.new
set.add(*[1, 1, 2, 3])
puts set.size
puts set.include? 4
set.remove 1
puts set.include? 1