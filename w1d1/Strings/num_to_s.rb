

def num_to_s(num, base)
  base16 = {
    0 => '0',
    1 => '1',
    2 => '2',
    3 => '3',
    4 => '4',
    5 => '5',
    6 => '6',
    7 => '7',
    8 => '8',
    9 => '9',
    10 => 'A',
    11 => 'B',
    12 => 'C',
    13 => 'D',
    14 => 'E',
    15 => 'F',
  }
  temp_array = []
  if base == 2
    x = 1
    while x < num do
      temp_array << (num / x) % 2
      x = x * 2
    end
  elsif base == 10
    x = 1
    while x < num do
      temp_array << (num / x) % 10
      x = x * 10
    end
  elsif base == 16
    x = 1
    while x < num do
      temp_array << base16[(num / x) % 16]
      x = x * 16
    end
  end
  temp_array.reverse
end






