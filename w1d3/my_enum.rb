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
      (self[self.length/2 - 1] + self[self.length/2])/2.0
    else
      self[self.length/2]
    end
  end

  def self.concat_strs(arr)
    arr.inject(:+)
  end
end