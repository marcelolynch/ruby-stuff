String.class_eval do
	def palindromo?
		self.downcase == self.reverse.downcase
	end
end

puts "Inserte una palabra"
str = gets.chomp
if str.palindromo?
	puts "Es palindromo"
else
	puts "No es palindromo"
end
