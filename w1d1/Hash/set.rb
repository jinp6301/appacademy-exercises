def set_add_el(hash, sym)
  hash[sym] = true
  hash
end

def set_remove_el(hash, sym)
  hash.delete(sym)
  hash
end

def set_list_els(hash)
  hash.keys
end

def set_member?(hash, sym)
  hash.has_key?(sym)
end

def set_union(hash1,hash2)
  hash3 = hash1.merge(hash2)
  hash3
end

def set_intersection(hash1, hash2)
  hash3 = {}
  hash2.each do |key, val|
    if hash1.has_key?(key)
      hash3[key] = val
    end
  end
  hash3
end

def set_minus(hash1, hash2)
  hash3 = {}
  hash1.each do |key, val|
    if hash2.has_key?(key) == false
      hash3[key] = val
    end
  end
  hash3
end

