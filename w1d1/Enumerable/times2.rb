def doublearr(arr)
  arr.map{ |i| 2*i }
  arr
end

def my_each
    i = 0;
    while self[i]
        yield self[i]
        i += 1
    end
    self
end

def median(arr)
  arr_length = arr.length
  if arr_length % 2 == 0
    return (arr.sort[arr_length/2 - 1] + arr.sort[arr_length/2])/2.to_f
  else
    return arr.sort[(arr_length)/2]
  end
end

def concatenate(arr)
  arr.inject("") do |blank,each|
    blank + each
  end
end


