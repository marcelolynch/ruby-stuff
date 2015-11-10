class Trip
	attr_reader :date, :desc, :price
	def initialize(date, desc, price)
		@date = date
		@desc = desc
		@price = price
	end
end