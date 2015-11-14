load "LinkedList.rb"


list = LinkedList.new
list.add(8)
list.add(9)
list.add(10)
list.each {|x| puts x}
puts list.count
puts list.max
puts list[0]
puts list.last
list.remove(10)
puts "Count #{list.count}"
list.each {|x| puts x}

list[0] = 0
list[2] = 4
puts list[2]
puts list.count
