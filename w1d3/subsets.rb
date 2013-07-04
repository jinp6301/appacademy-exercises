# def subsets(array)
#   if array.length == 1
#     result = array
#   else
#     x = split_array(array)
#     x.each do |i|
#       subsets(i)
#     end
#     result << x
#   end
#   result
# end
#
#
# def split_array(array)
#   array.combination(array.length - 1).to_a
# end

# def subsets(array, x = [[]])
#
#   last_number = array.pop
#   x.each_with_index do |sub_array, index|
#     x[index] += [last_number]
#   end
#   x << [last_number]
#   puts "hi"
#   subsets(array, x) until array.length == 0
#   x
# end

def subsets(array)
  if array.length == 0
    return [[]]
  elsif array.length == 1
    return [[],array]
  end

  x = subsets(array[0..-2])

  y = []
  x.length.times do |i|
    y << x[i]
  end

  x.each_with_index do |sub_array, index|
    x[index] += [array[-1]]
  end

  # result += [array]

  y + x
end