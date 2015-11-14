module Iter 
	def iter
		(1..self).each {|x| yield(x)}
	end
end


class Fixnum
	include Iter
end



5.iter do |x|
	puts 10*x
end