def concatenar(num1, num2)
	str = num1.to_s + num2.to_s
	str.to_i
end

puts concatenar(8, 4) * 2
