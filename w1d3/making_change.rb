def make_change(amount, coins = [25, 10, 5, 1])
  final_coins = []
  coins.each do |coin|
    final_coins << amount / coin
    amount -= (amount/coin) * coin
  end
  final_coins
end

def make_change2(amount, coins = [25, 10, 5, 1])
  if amount == 0
    return result
  # elsif amount == 5
  #   result << 5
  # elsif amount == 10
  #   result = [10]
  # elsif amount == 25
  #   result = [25]
  else
    largest_coin = []
    coins.each do |coin|
      if amount - coin > 0
        largest_coin << coin
      else
        largest_coin << -1
      end
    end
    result = largest_coin.max
    make_change2(amount - largest_coin.max)

  end

end