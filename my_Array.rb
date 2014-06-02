class Array
  def my_each(&prc)
    idx = 0
    self.size.times do
      prc.call (self[idx])
      idx += 1
    end
  end # my_each

  def my_map(&prc)
    idx = 0
    [].tap do |new_arr|
      self.size.times do
        new_arr << prc.call(self[idx])
        idx += 1
      end
    end
  end # my_map

  def my_select(&prc)
    idx = 0
    [].tap do |new_arr|
      self.size.times do
        new_arr << self[idx] if prc.call(self[idx])
        idx += 1
      end
    end
  end # my_select

  def my_inject(&prc)
    idx = 1
    container = self.first
    (self.size-1).times do
      container = prc.call(container,self[idx])
      idx += 1
    end
    container
  end # my_inject

  def my_sort!(&prc)
    sorted = false
    until sorted
      num_swaps = 0
      (0...self.length - 1).each do |idx|
        if prc.call(self[idx], self[idx + 1]) == 1
          self[idx], self[idx + 1] = self[idx + 1], self[idx]
          num_swaps += 1
        end
      end
      sorted = num_swaps == 0
    end
    self
  end

  # def my_quicksort(array)
#     return array if array.size < 2
#     pivot = array.sample
#
#     lower, upper = array.last, array.first
#   end


end # Array

test = Array.new
p test = %w{1 2 3}
test.my_each { |el| p "#{el}"}
p test.my_map { |el| el * 2 }
p test.my_select { |el| el == '2'}
p [1, 2, 3, 4].my_inject { |sum, num| sum * num }