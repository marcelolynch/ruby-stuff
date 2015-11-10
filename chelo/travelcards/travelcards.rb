require_relative 'trip'
module Cards
	class TravelCard
		attr_reader :balance, :movements, :id

		def initialize(args)
			@balance = args[:balance] || 0
			@central = args[:central]
			@id = args[:id]
			
			@movements = []
		end

		def travel(date, desc, to_charge)
			if chargeable?(to_charge)
				@movements << Trip.new(date,desc,to_charge)
				@balance -= to_charge
				return true
			else
				puts "Can't do so. Balance is #{@balance}"
				return false
			end
		end

		def add(amount)
			raise ArgumentError if (amount <= 0)
			@balance += amount
		end

		def ==(other)
			other.instance_of?this.class && self.id == other.id
		end

		def eql?(other)
			self == other
		end

		def hash
			id
		end

		private
		def chargeable?(to_charge)
			(balance - to_charge) >= @central.balanceLimit
		end
	end


	#Tarjeta para jubilados, descuento de 20% definido en central
	class ElderlyCard < TravelCard
		def travel(date, desc, price)
			super(date, desc, price*(1-@central.get_discount(self)))
		end
	end


	class StudentCard < TravelCard
	end
end
