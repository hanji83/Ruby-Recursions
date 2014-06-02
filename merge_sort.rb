def merge_sort(array)
  return array if array.size == 1

  pivot = array.size / 2
  lower = merge_sort(array[0...pivot])
  upper = merge_sort(array[pivot..- 1])

  return merge(lower, upper)
end

def merge(arr1, arr2)
  result = []
  until arr1.empty? && arr2.empty?
    p arr1
    p arr2
    if arr1.empty? && !arr2.empty?
      result << arr2.shift
    elsif arr2.empty? && !arr1.empty?
      result << arr1.shift
    else
      arr1.first <= arr2.first ? result << arr1.shift : result << arr2.shift
    end
  end
  result
end # merge

at = [2, 4, 1, 5, 6, 8, 3, 7, 9, 10]
p merge_sort(at)