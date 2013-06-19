def find_factors(number)
  i = 1
  factors = []
  until i > number/2.to_f
    factors << i if number % i == 0
    i += 1
  end
  factors << number
end

def number_factors
  i = 1
  while i <= 100
    puts find_factors(i).join(' ')
    i += 1
  end
end