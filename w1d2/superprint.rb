def super_print(word,options = {})
  default_options = {times: 1, upcase: false, reverse: false}
  options = default_options.merge(options)

  word.reverse! if options[:reverse]
  word.upcase! if options[:upcase]

  options[:times].times do
    print word
  end
end