class SavingsAccount

	@@bank_name="MyBank.com"

	def initialize(starting_balance=0)
		@balance = starting_balance
	end

	def balance
		@balance
	end

	def balance=(new_amount)
		@balance = new_amount
	end

	def deposit(amount)
		@balance += amount
	end

	def self.bank_name
 		@@bank_name
	end

end

#puts SavingsAccount.new.@balance #Incorrecto. @ indica la variable de instancia dentro del objeto, y es privada
puts SavingsAccount.new.balance #Correcto. Se accede al metodo balance
puts SavingsAccount.new.balance() #Correcto. Equivalente al anterior


class Person

	attr_accessor:first_name,:last_name
	attr_reader:address
	attr_writer:age
	
	def initialize(first_name,last_name,address=nil,age=nil)
		@first_name=first_name
		@last_name=last_name
		@address=address
		@age=age
	end

	def age
		@age
	end
end

#Correcto. Age queda en nil
Person.new('James', 'Wilson', 12).first_name 

#Incorrecto, necesita al menos 2 parametros ya que no hay default
#Person.new 								

#Correcto, first_name= esta implementado por la llamada a attr_accessor
Person.new('James', 'Wilson').first_name = 'John' 

#Incorrecto, address= no esta implementado
#Person.new('James', 'Wilson').address = 'Charles St. 123'

#Incorrecto, age no es un metodo de clase
#Person.age = 12

#Incorrecto, el metodo age= no esta implementado
Person.new('James', 'Wilson', 12).age = 13

#Incorrecto, age= no esta implementado, y ademas no se puede construir sin parametros
#Person.new.age = 14