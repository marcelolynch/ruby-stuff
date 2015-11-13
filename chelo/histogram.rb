# a) Escriba una función que reciba un Array de números y dibuje un histograma con
# las ocurrencias de cada número.

# b) Modifique el programa anterior para que el histograma sea vertical


class Histogram
	def horizontal(ary)
		((ary.min)..(ary.max)).each do |elem|
			print "#{elem}: "
			ary.count(elem).times {print "* "}
			puts ""
		end
	end

	def vertical(ary)
		max_freq = max_num_occurrences(ary)
		print_freq_cols(ary, max_freq)
	end

	private
	def max_num_occurrences(ary) 	#habra una mejor manera?
		moda = ary.max_by {|x| ary.count(x)}	#El elemento que mas aparecio 
		ary.count(moda)							#La cantidad de veces que aparecio 
	end
	
	# Imprime max_freq filas, cada fila tiene un asterisco en la columna
	# correspondiente al elemento si la cantidad de apariciones de ese elemento
	# es mayor o igual a el numero de esa fila contando de abajo (max_freq - row_idx
	# si row_idx es el indice de la fila contando desde la primera)
	def print_freq_cols(ary, max_freq) 
		(0...max_freq).each do |row_idx|
			(ary.min .. ary.max).each do |elem|
				print (ary.count(elem) >= max_freq - row_idx) ? " * " : "   "
			end
			puts ""
		end
		(ary.min..ary.max).each {|elem| print " #{elem} "} #Fila con los elementos
	end
end


Histogram.new.vertical([1,1,1,1,1,1,1,4,4,2,3,2,3,2,5,5,5,5,5])
