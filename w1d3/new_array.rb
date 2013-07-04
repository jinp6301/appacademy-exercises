class Array

  def my_each(&block)
    i = 0
    while i < self.count
      block.call(self[i])
      i += 1
    end
    self
  end

  def my_map(&block)
    i = 0
    mapped_array = []
    while i < self.count
      mapped_array << block.call(self[i])
      i += 1
    end
    mapped_array
  end

  def my_select(&block)
    i = 0
    select_array = []
    while i < self.count
      if block.call(self[i])
        select_array << self[i]
      end
      i += 1
    end
    select_array
  end

  def my_inject(&block)
    i = 1
    result = self[0]
    while i < self.count - 1
      result += block.call(self[i], self[i + 1])
      i += 1
    end
    result
  end

  def my_sort!(&block)
    if block.call(1,2) == -1
      bubble_sort(self)
    elsif block.call(1,2) == 1
      reverse_bubble_sort(self)
    end
    self
  end

  def some_method(*arg, &block)
    if block_given?
      block.call(arg)
    else
      puts "No block"
    end
  end

end


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

def reverse_bubble_sort(array)
  array.length.times do
    (0...array.length).each do |index|
      # (index1...array.length).each do |index2|
      next if (index + 1) == array.count
      if array[index] < array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
      end
    end
  end
  array
end