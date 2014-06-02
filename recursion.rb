# require 'debugger'
def range_iter(start, finish)
  [].tap do |array|
    while start < finish -1
      array << start += 1
    end
  end
end # range_iter

def range_recur(start, finish)
  return [finish - 1] if (finish - start == 2)
  range_recur(start, finish - 1) + [finish - 1]
end # range_recur

def exp_1(base, exp)
  return 1 if exp == 0
  exp_1(base, (exp - 1)) * base
end # exp_1

def exp_2(base, exp)
  return 1 if exp == 0
  if exp.even?
    exp_2(base, (exp / 2)) * exp_2(base, (exp / 2))
  else
    exp_2(base, ((exp - 1) / 2)) * exp_2(base, ((exp - 1) / 2)) * base
  end
end # exp_2

def deep_dup(array)
  return array if !array.is_a?(Array)
  [].tap do |new_array|
    array.each { |el| new_array << deep_dup(el) }
  end
end # deep_dup

def fib_iter(n)
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2
  result = [0, 1]
  (2...n).each do |idx|
    result << result[idx - 2] + result[idx - 1]
  end
  result
end # fib_iter

def fib_recur(n)
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2
  result = []
  result += fib_recur(n - 1)
  result << result[-1] + result[-2]
  result
end # fib_recur

def bsearch(array, target)
  pivot = array.size / 2
  lower = array[0...pivot]
  upper = array[pivot..- 1]

  if array[pivot] == target
    pivot
  elsif array[pivot] > target # if in lower, return idx
    bsearch(lower, target)
  elsif array[pivot] < target # if in uppper, return idx + pivot
    bsearch(upper, target) + pivot
  end
end # bsearch

def make_change(total, coins = [25, 10, 5, 1])
  best_change = []
    coins.each_with_index do |coin, index|
      next if total < coin

      remainder = total - coin

      this_change = [coin] + make_change(remainder, coins[index..-1])

      best_change = this_change if best_change.empty?
      best_change = this_change if this_change.length < best_change.length

    end
  best_change
end # make_change

p make_change(14, coins = [10, 7 ,1])


