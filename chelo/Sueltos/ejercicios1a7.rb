require 'set'

class Intro
	#Ejercicio 1
	 #Hacer un programa que muestre en pantalla el mensaje “Hello World”
	def Intro.hello_world 		#equivalente a self.hello_world (de clase)
		puts "Hello, world!"
	end


	#Ejercicio 2
	  #Escribir un programa que informe si un número es par o impar
	def self.even?(num) 
		num%2 == 0
	end


	#Ejercicio 3
	  #Investigar qué hace el método to_s de los Object de Ruby y escribir una función
	  #que reciba dos números y concatene sus caracteres. Ej: concatenar(2, 4) : “24”
	def self.concatenar(*args)
		result = String.new
		args.each {|x| result.concat(x.to_s)}
		result
	end


	#Ejercicio 4
	  #Dado el ejercicio anterior, hacer lo mismo pero obteniendo el número como
	  #resultado. Investigar qué hace el método is_a? de Object
	def self.concatenated_int(num1, num2)
		if ! (num1.is_a? Integer) || !(num2.is_a? Integer) then
			raise ArgumentError.new("NaN")
		end
		
		str1 = num1.to_s             #num1.to_s.concat(num2.to_s).to_i
		str2 = num2.to_s   
		(str1.concat(str2)).to_i 
	end

	#Ejercicio 5
	  #Investigar qué métodos hay disponibles para Array, y escribir una función
	  #que reciba un array de números y encuentre la suma de todos ellos.

	def self.sum_array(arr)
		sum = 0
		arr.each {|x| sum += x}
		sum
	end

	def self.sum_array2(arr)
		arr.reduce(:+) #Cool
	end


	#Ejercicio 6 
	 #Investigar qué métodos hay disponibles para la clase String y escribir un programa
	 #que informe si una cadena es palíndromo.
	 def self.palindrome?(str="")
	 	str.downcase.reverse == str.downcase
	 end

	#Ejercicio 7
	 #Escriba un programa que indique si un triángulo es isósceles, 
	 #escaleno o equilátero.
	 def self.triangle_type(side1,side2,side3)
	 	sides = [side1.to_f, side2.to_f, side3.to_f]
	 
	 	case sides.count(side1)
	 	when 3
	 		puts "Equilatero"
	 	when 2
	 		puts "Isosceles"
	 	when 1
	 		puts (sides.count(side2) == 2 ? "Isosceles" : "Escaleno")
	 	end
	 end


	def self.triangle_type2(side1,side2,side3)
	 	sides = [side1,side2,side3]
	 	distinct = sides.group_by {|x| x.to_f} #=> hash agrupados por valor
	 
	 	case distinct.size #Tamaño = valores distintos dentro de sides
	 	when 3	
	 		puts "Escaleno" 
	 	when 2
	 		puts "Isosceles"
	 	when 1
	 		puts "Equilatero"
	 	end
	 end	 


	 	def self.triangle_type3(side1,side2,side3)
	 	distinct = Set.new [side1.to_f, side2.to_f, side3.to_f]
	 	case distinct.size #Tamaño = valores distintos
	 	when 3	
	 		puts "Escaleno" 
	 	when 2
	 		puts "Isosceles"
	 	when 1
	 		puts "Equilatero"
	 	end
	 end	 

end

ary = [1,2,3,2,2]
puts ary.count
puts Intro.palindrome?"Menem"
Intro.triangle_type2(2,2,2)
