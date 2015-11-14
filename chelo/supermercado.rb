require './Lists'
module Market
class Queue < ArrayList
	attr_reader :max_length, :avg
	alias :queue :add

	def initialize
		super
		@max_length = 0
		@avg = 0
	end

	def dequeue
		remove_at(0)
	end

	def compute_stats
		@avg = (@avg + size) / 2
		@max_length = size if size > @max_length
	end
end

class Cart
	attr_reader :elem_count

	def initialize(id, elem_count)
		@id = id
		@elem_count = elem_count
	end

	def to_s
		@id.to_s
	end

	def empty?
		@elem_count == 0
	end

	def withdraw_element
		@elem_count -= 1
	end
end


class Cashier
	attr_reader :id
	def initialize(id)
		@id = id
		@attending = nil
	end

	def ready?
		@attending.nil?
	end

	def attend(cart)
		raise ArgumentError.new("Not ready") if not ready?
		@attending = cart
	end

	def working?
		not ready?
	end


	def work
		if working?
			if not @attending.empty? then
				@attending.withdraw_element
			else
				@attending = nil
			end
		end
	end

end

SIMULATION_TIME = 100000
CART_ARRIVAL = 200
CART_ELEMENTS = 300
cashier=Cashier.new(1)

time=0
queue=Queue.new
random=Random.new

next_cart=random.rand(CART_ARRIVAL)
cart_count=1

while time<SIMULATION_TIME do
		if time > next_cart
	cart = Cart.new(cart_count,1+random.rand(CART_ELEMENTS));
	cart_count+=1
	puts "Cart arriving: " + cart.to_s + " at time: " + time.to_s
	queue.queue(cart)
	next_cart=time+random.rand(CART_ARRIVAL)
	end

	if cashier.ready? and not queue.empty?
		cart=queue.dequeue

		puts "Attending cart: " + cart.to_s + " size: " + cart.elem_count.to_s
		cashier.attend(cart)

	end

	queue.compute_stats
	cashier.work
	time+=1
end

#puts"CashierInactivity%:"+caja.inactivity.to_s

puts"Max queue length: "+queue.max_length.to_s

puts"Average Queue Length: "+queue.avg.to_s
end