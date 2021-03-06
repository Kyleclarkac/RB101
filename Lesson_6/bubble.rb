
def bubble_sort!(array)
  swapped = true
  while swapped
    swapped = false
    array.each.with_index do |ele, inx|
      if (ele <=> array[inx + 1]) == 1
        array[inx], array[inx + 1] = array[inx + 1], array[inx]
        swapped = true
      end
      break if inx == array.size - inx + 2
    end
  end
end






array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)