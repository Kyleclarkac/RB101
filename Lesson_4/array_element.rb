arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
p arr         # => [2, 2, 3, 4, 5]
arr[1..-1] = arr[1..-1].map{|ele| ele +=1}
p arr


hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh # => { :apple => "Fruit", :carrot => "Produce", :pear => "Produce", :broccoli => "Produce" }

hsh[:apple] = 'Fruit'
hsh[:carrot] = 'Vegetable'
hsh[:pear] = 'Fruit'
hsh[:broccoli] = 'Vegetable'
p hsh