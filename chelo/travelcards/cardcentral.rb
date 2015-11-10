require_relative 'travelcards.rb'
require 'set'

module Cards
	class CardCentral
		attr_reader :balanceLimit

		def initialize
			@balanceLimit = -10
			@elderly_cards = Set.new
			@elderly_discount = 0.2

			@student_cards = Set.new
			@student_discount = 0.8

			@next_id = 0
		end

		def newCard(initialBalance=0)
			card = TravelCard.new({ :id => @next_id, 
							:balance => initialBalance, 
							 :central => self})
			@next_id += 1

			return card
		end

		def newElderlyCard(initialBalance=0)
			card = ElderlyCard.new({ :id => @next_id, 
							:balance => initialBalance,
							 :central => self})
			@elderly_cards << card.id
			@next_id += 1

			return card
		end

		def newStudentCard(initialBalance=0)
			card = StudentCard.new({ :id => @next_id, 
							:balance => initialBalance, 
							 :central => self})
			@student_cards << card.id
			@next_id += 1
		end

		def get_discount(card)
			if @student_cards.include?card.id
				return @student_discount
			elsif @elderly_cards.include?card.id
				return @elderly_discount
			else
				return 0
			end
		end
	end
end

include Cards
central = CardCentral.new

ecard = central.newElderlyCard(0)
puts ecard.balance
ecard.add(100)
puts ecard.balance
ecard.travel("20141003", "SubteD:CongresodeTucuman", 10)
ecard.travel("20141001", "SubteB", 10)
ecard.travel("20141001", "SubteA", 10)
puts ecard.balance

ecard.movements.each do |x|
	puts "#{x.date} - #{x.desc} - #{x.price}"
end
