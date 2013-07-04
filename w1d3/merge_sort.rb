def merge_sort(array)
  if array.length < 2
    return array
  end

  left, right = split_array(array)
  result = combine(merge_sort(left), merge_sort(right))
end

def split_array(array)
  middle = array.length/2
  [array.take(middle), array.drop(middle)]
end

def combine(array1, array2)
  if array1.empty? || array2.empty?
    if array2.empty?
      return array1
    else
      return array2
    end
  else
    nil
  end

  smallest = array1.first <= array2.first ? array1.shift : array2.shift
  combine(array1, array2).unshift(smallest)
end