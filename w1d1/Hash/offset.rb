def hash_correct(hash)
  alpha = ('a'..'z').to_a

  temp_hash = {}
  hash.each do |key,val|
    temp_hash[alpha[alpha.index(key.to_s) + 1].to_sym]=val
  end
  temp_hash
end