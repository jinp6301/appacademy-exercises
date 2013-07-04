

def range(start, ending)
  if !defined? range_array
    range_array = []
  end

  while start != ending + 1
    range_array << start
    start += 1
    range(start, ending)
  end
  range_array
end

def sum_of_array_iter(array)
  i = 0
  sum = 0
  while i < array.count
    sum += array[i]
    i += 1
  end
  sum
end

def sum_of_array_recurs(array)
  if array.length == 0
    sum_num = 0
  else
    x = sum_of_array_recurs(array[0..-2])
    sum_num = x + array[-1]
  end
  sum_num
end

def sum_of_array_recurs2(array)
  return 0 if array.length == 0
  x = sum_of_array_recurs2(array[0..-2])
  x + array[-1]
end

def exponent1(base, exp)
  if !defined? result
    result = 0
  end

  if exp == 0
    result = 1
  else
    result += base * exponent1(base, exp - 1)
  end
end

def exponent2(base, exp)
  if !defined? result
    result = 0
  end

  if exp == 0
    result = 1
  elsif exp.even?
    result += exponent2(base, exp / 2) ** 2
  elsif exp.odd?
    result += base * (exponent2(base, (exp - 1) / 2) ** 2)
  end
end

def deep_dup(array)
  if !defined? result
    duplicate = []
  end

  array.each_with_index do |el, index|
    if index < array.count
      if el.is_a? Array
        deep_dup(el)
      else
        duplicate << el
      end
    else
      return duplicate
    end
  end
end

# def fib_rec(num)
#   if !defined? result
#     result = [0,1]
#   end
#
#   if num == 0
#     result = [0]
#     return result
#   elsif num == 1
#     result = [0,1]
#   elsif num == 2
#     return result
#   elsif num > 2
#     result << result[-1] + result[-2]
#     return result
#     fib_rec(num - 1)
#   end
#   result
#
# end

def fib_rec(num)
  if num == 0
    result = []
  elsif num == 1
    result = [0]
  elsif num == 2
    result = [0,1]
  else
    # x = [0,1]
    # x = fib_rec(2)
    # x = fib_rec(3)
    x = fib_rec(num - 1)
    # num = 3 => result should be [0,1,1]
    result = x
    result << x[-1] + x[-2]
  end
  result
end




def fib_iter(num)
  if !defined? result
    result = [0,1,1]
  end
  if num == 1 || num == 0
    result = [0]
  elsif num == 2
    result = [0,1]
  else
    3.upto(num-1) do |index|
      result[index] = result[index - 1] + result[index - 2]
    end
  end
  result
end

class Array
  def self.double(arr)
    arr.map {|num| num * 2}
  end

  def my_each(&block)
    0.upto(self.length) do |i|
      block.call(self[i])
    end
    self
  end

  def median
    if self.length % 2 == 0
      (self[self.length/2 - 1] + self[self.length/2])/2
    else
      self[self.length/2]
    end
  end

  def self.concat_strs(arr)
    arr.inject(:+)
  end
end

def binary(array, target)
  # [1,2,3] => target = 3
  sorted_array = array.sort # [1,2,3]
  median_point = sorted_array.median # 2

  if median_point == target
    x = array
    return array.index(target)
  elsif median_point < target # is 2 < 3? YES
    x = sorted_array[sorted_array.length/2..-1]
    result = binary(x, target)
    sorted_array.length/2 + result
  elsif median_point > target # is 2 > 3? NO
    x = sorted_array[0...sorted_array.length/2]
    result = binary(x, target) #binary(sorted_array[0..])
  end
end

def binary_recursion(array, target)
  array.index(binary(array, target))
end

def binary1(array,target)
  if median_point == target
    return sorted_array.index(target)
  elsif median_point < target

  elsif num == 2
    result = [0,1]
  else
    # x = [0,1]
    # x = fib_rec(2)
    # x = fib_rec(3)
    x = fib_rec(num - 1)
    # num = 3 => result should be [0,1,1]
    result = x
    result << x[-1] + x[-2]
  end
  result
end