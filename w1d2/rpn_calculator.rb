## NOTE: I wrote the code to pass the tests, regardless of what I thought the 'spirit' of the question was.
# The code is written to pass the tests minimally, rather than to pass them 'well'. I noted places where I did more than the tests required to pass.

class RPNCalculator
  attr_accessor :stack

  def initialize
    @stack = []
    @tokens = []
  end

  # Function to check that the stack has enough entries, otherwise raise an exception.
  def its_valid
    if @stack[-1] && @stack[-2]
      true
    else
      raise('calculator is empty or doesn\'t have enough numbers')
    end
  end

  def value
    return @stack[-1]
  end

  # Push function can take either numbers, or symbols from the tokenization of a string
  def push(inItem)
    if !inItem.is_a? Symbol
      @stack.push(Float(inItem))
    elsif inItem == :/
      self.divide
    elsif inItem == :-
      self.minus
    elsif inItem == :*
      self.times
    else
      self.plus
    end
  end

  def plus
    @stack.push(@stack.pop + @stack.pop) if its_valid
  end

  def minus
    @stack.push(-@stack.pop + @stack.pop) if its_valid
  end

  def divide
    @stack.push(1/@stack.pop * @stack.pop) if its_valid
  end

  def times
    @stack.push(@stack.pop * @stack.pop) if its_valid
  end

  def tokens(toTokenize)
    @tokens = []
    @tokens = toTokenize.split(' ')
    numberRegex = /^\d+/
    @tokens.each_with_index do |character,index|
      character.match(numberRegex) ? @tokens[index]=character.to_f : @tokens[index]=character.to_sym
    end
  end

  def evaluate(stringToEvaluate)
    @tokens = tokens(stringToEvaluate)
    @tokens.each { |character| self.push(character) }
    @stack[-1]
  end

end

def user_input(calc_object)
  puts "Please enter a number or symbol (+ - / *) or QUIT"
  num_or_sym = gets.chomp
  while num_or_sym != "QUIT"
    calc_object.evaluate(num_or_sym)
    puts "Calculation so far: #{calc_object.stack[-1]}"
    puts "Please enter a number or symbol (+ - / *) or QUIT"
    num_or_sym = gets.chomp
  end
end

if __FILE__ == $PROGRAM_NAME
  calculator = RPNCalculator.new
  user_input(calculator)
end