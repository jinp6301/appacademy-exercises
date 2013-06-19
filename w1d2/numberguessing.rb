def guess_number()
  puts "Guess a Number"
  guess = gets.chomp.to_i

  comp_number = rand(1..100)
  i = 1
  while guess != comp_number
    puts hi_or_low(guess, comp_number)
    puts "Guess a Number"
    guess = gets.chomp.to_i
    i += 1
  end
  puts "You win!"
  puts "It took #{i} guesses"
end

def hi_or_low(guess, comp_number)
  guess > comp_number ? "high" : "low"
end
