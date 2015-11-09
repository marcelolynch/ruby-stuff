#ruby.rb
module Modulo1
	CONSTANT = 10
  def Modulo1.test(arg1="default")
  	puts arg1
  end

#  def test()
 # 	puts "Wooo"
  #end
  
end

module Modulo2

class Test
	def test
		Modulo1::test
	end
end
end

Modulo2::Test.new.test