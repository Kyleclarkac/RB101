def merge(arr1, arr2)
  count1 = 0
  count2 = 0
  merged = []

  until arr1[count1].nil? && arr2[count2].nil?
    if !arr1[count1].nil? && (arr2[count2].nil? || arr1[count1] <= arr2[count2])
      merged << arr1[count1]
      count1 += 1
    else 
      merged << arr2[count2]
      count2 += 1
    end
  end
  merged
end





p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]