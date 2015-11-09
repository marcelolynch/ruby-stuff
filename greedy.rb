#Ejercicio 11
  #Greedy es un juego que se juega con dados, y consiste en sumar la mayor
  #cantidad de puntos. Las reglas son las siguientes:
     #Cada terna de 1's (unos) vale 1000 puntos, un 1, que no pertenece a
    #ninguna terna, vale 100 puntos.
      #Cada 5 que no pertenece a ninguna terna, vale 50 puntos.
    #Cada terna de números que no sean 1, vale 100 por el valor del número.
    #Se pide implementar la función que devuelva el puntaje.

class Greedy
	def self.points(dice)
		points = 0

		ones = dice.count(1)
		one_triples = ones/3		 
		points += 1000*one_triples + (ones%3)*100  #Ternas de ases mas los libres

		points += 50 * (dice.count(5)%3) #Cinco libres (no terna)

		(2..6).each do |x|					#Ternas del 2 al 6
			appearances = dice.count(x)
			triples = appearances/3
			points += 100 * x * triples
		end

		points			
	end
end

puts Greedy.points([]) 			# => 0
puts Greedy.points([1]) 		# => 100
puts Greedy.points([5]) 		# => 50
puts Greedy.points([1,1,1,3])	# => 400
puts Greedy.points([2,6,6,6]) # => 400