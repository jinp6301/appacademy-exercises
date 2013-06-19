def caesar(str,int)
  alpha = ('a'..'z').to_a

  split_str = str.split(//)

  temp_arr_0 = []

  split_str.each do |char|
    temp_arr_0 << alpha.index(char)
  end

  temp_arr_1 = []

  temp_arr_0.each do |ind|
    if ind + int > 25
      temp_arr_1 << ind + int - 26
    else
      temp_arr_1 << ind + int
    end
  end
  temp_arr_2 =[]
  temp_arr_1.each do |ind|
    temp_arr_2 << alpha[ind]
  end
  temp_arr_2.join
end