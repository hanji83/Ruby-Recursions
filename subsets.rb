def subsets(array)
  return [[]] if array.size == 0
  lower_subset = subsets(array[0...-1])
  upper_subset = lower_subset.map { |el| el + [array.last] }
  lower_subset + upper_subset
end

p subsets([1,2,3])
