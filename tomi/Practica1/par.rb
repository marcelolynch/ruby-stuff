puts "Inserta un numero"
str = gets.chomp
num = str.to_i
str = num.even? ? "es par" : "es impar"
puts "El numero #{num} " + str
