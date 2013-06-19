#!/usr/bin/env ruby

#require 'debugger'

def prime?(num)
#  debugger

  (2...num).each do |i|
    if (num % i) == 0
      return false
    end
  end
  puts true
end




if __FILE__ == $PROGRAM_NAME
  prime?(5)
end