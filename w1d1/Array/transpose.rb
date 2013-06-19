def my_transpose(arr)
  trans_array = []
  for x in 0...arr.length
    trans_array << Array.new(arr.length)
    for y in 0...arr.length
      trans_array[x][y] = arr[y][x]
    end
  end
  trans_array
end
