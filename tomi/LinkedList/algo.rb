class Integer
	alias to upto

	def iter
		self.downto(1) {|x| yield x}
	end
end

1.to 5 do |x|
	puts x
end

5.iter do |x|
	puts x * 10
end
