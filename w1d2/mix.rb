def remix(drink_mixer_array)
  alcohol_mixer_split = split_liquids(drink_mixer_array)

  alcohol = alcohol_mixer_split[0].shuffle!
  mixer = alcohol_mixer_split[1].shuffle!

  recombine_liquids(alcohol,mixer)
end

def split_liquids(drink_mixer_array)
  alcohol, mixer = [], []
  drink_mixer_array.each do |drink_pair|
    alcohol << drink_pair[0]
    mixer << drink_pair[1]
  end
  [alcohol, mixer]
end

def recombine_liquids(alcohol,mixer)
  mixed_drinks = []
  alcohol.length.times do
    mixed_drinks << [alcohol.pop, mixer.pop]
  end
  mixed_drinks
end