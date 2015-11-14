class AssertionFailed < Exception
end

class TestCase
	def setUp
	end

	def tierDown
	end

	def assertTrue(expresion)
		if not expresion then
			raise AssertionFailed.new(expresion.to_s + " is not true")
		end
	end

	def assertEquals(result, expected)
		if result != expected
			raise AssertionFailed.new(result.to_s + " is not equal to " + expected.to_s)
		end
	end
end


class IntegerTest < TestCase

	def setUp
		@number = 1
	end

	def testSum
		assertTrue(1 + @number == 2)
		@number += 1
	end

	def testSub
		assertTrue(2 - @number == 0)
	end

	def testMulByZero
		assertEquals(@number*0, 1)
	end

	def testAddByZero
		assertEquals(@number + 0, @number + 1)
	end
end


class Tester
	def self.test(_class)
		obj = _class.new
		obj.setUp
		test_methods = obj.methods.grep(/test*/)
		test_methods.each do |t|
			begin
				obj.send(t)
			rescue Exception => e
				puts "[*] #{t.to_s} failed: " + e.message
			end
		end

	end
end



Tester.test(IntegerTest)