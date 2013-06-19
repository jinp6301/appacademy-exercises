def move(stacks)

  print "What stack do you to move? "
  move_from = gets.to_i
  print "Where do you want to move it? "
  move_to = gets.to_i
  temp_stacks = stacks

  temp_stacks[move_to].unshift(temp_stacks[move_from].shift)

  temp_stacks.each do |stack|
    if stack.sort != stack
      print "ILLEGAL MOVE!!!!!!!"
      return stacks
    end
    temp_stacks
  end
end