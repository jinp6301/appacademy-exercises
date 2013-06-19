def stock(arr)
  temp_arr_1 = []
  for x in 0...arr.length - 1
    temp_arr_0 = []

    for y in x...arr.length
      temp_arr_0 << arr[x]-arr[y]
    end
    temp_arr_1 << temp_arr_0
  end
  temp_arr_2 = []
  for z in 0...temp_arr_1.length
    temp_arr_2 << temp_arr_1[z].min
  end
  buy_date = temp_arr_2.index(temp_arr_2.min)
  sell_date =temp_arr_1[buy_date].index(temp_arr_1[buy_date].min)
  [buy_date,sell_date+buy_date]

end