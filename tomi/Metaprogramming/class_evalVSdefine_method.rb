class Action
	attr_accessor :activity
	def initialize(current_activity)
		@activity = current_activity
	end

	#No anda ya que define_method es de Module y una instancia de Action no es un Module. En cambio Action, que es un Class si.
	def aaa
		define_method("aa") {puts "aa"}
	end

	def self.add_new_activity(*activities)
		activities.each do |a|
			define_method("doing_#{a}?") do
				@activity.to_sym == a
			end
		end
	end

	add_new_activity :nothing, :running
end

a = Action.new("nothing")
puts a.doing_nothing?
Action.add_new_activity(:sitting, :sleeping)
puts a.doing_sitting?
Action.class_eval do
	def hola
		puts "hola"
	end
end
a.hola
a.aaa

# class_eval: requiere de la escritura del código textual. Se está abriendo la clase y agregando cosas. Al hacerse
# de forma recursiva hay que tener cuidad con el nombre del método y las variables que se usan dentro del método.
# Apropiado para agregar métodos a clases ya creadas.
#
# define_method: mucho más apropiado para crear métodos de forma dinámica. Se pasa el nombre del método como string
# y lo que debe hacer a través de un bloque.
