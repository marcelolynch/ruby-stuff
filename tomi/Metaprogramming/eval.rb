# lo q tenga eval evalua codigo que se manda como string o bloque

eval "puts \"hello\""
String.class_eval "puts \"en la clase\""


a = "como va"

str = "hola"
str.instance_eval do
	def hi
		puts "hi"
	end
end

str.hi
