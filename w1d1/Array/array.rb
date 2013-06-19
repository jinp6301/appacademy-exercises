class Array
  def my_uniq
    my_uniq_array = []

    self.each do |val|
      if my_uniq_array.include? val
      else
        my_uniq_array << val
      end

    end
    my_uniq_array
  end
  def two_sum
    total_sum = []
    sum_length = self.length
    for x in 0..sum_length - 2
      for y in x + 1..sum_length - 1
        if self[x] + self[y] == 0
          total_sum << [x,y]
        end
      end
    end
    total_sum
  end
end
[1,2,1,3,3].my_uniq