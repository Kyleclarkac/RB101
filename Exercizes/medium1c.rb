def toggle_time(n)
  array = Array.new(n, false)
  n.times do |num|
    toggle_divis!(array, num + 1)
  end

  select_ons(array)
end

def toggle_divis!(arr, divisor)
  count = 0 
  loop do 
    arr[count] = !arr[count] if (count + 1)%divisor == 0
    count +=1
    break if count == arr.size
  end
end

def select_ons(array)
  on_indicies = []
  array.each.with_index {|switch, index| on_indicies << (index + 1) if switch }
  on_indicies
end

p toggle_time(100)
