def bubble_sort(array)
  array.length.times do
    (0...array.length).each do |index|
      # (index1...array.length).each do |index2|
      next if (index + 1) == array.count
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
      end
    end
  end
  array
end

p bubble_sort([8,9,4,1])

# def bubble_sort!
#   sorted = false
#   until sorted
#     sorted = true
#     self.count.times do |index|
#       # last element has no next element
#       next if (index + 1) == self.count
#
#       if self[index] > self[index + 1]
#         self[index], self[index + 1] = self[index + 1], self[index]
#         sorted = false
#       end
#     end
#   end
# end