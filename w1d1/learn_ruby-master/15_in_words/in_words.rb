class Fixnum

  def in_words
    words = {
      0 => 'zero',
      1 => 'one',
      2 => 'two',
      3 => 'three',
      4 => 'four',
      5 => 'five',
      6 => 'six',
      7 => 'seven',
      8 => 'eight',
      9 => 'nine',
      10 => 'ten',
      11 => 'eleven',
      12 => 'twelve',
      13 => 'thirteen',
      14 => 'fourteen',
      15 => 'fifteen',
      16 => 'sixteen',
      17 => 'seventeen',
      18 => 'eighteen',
      19 => 'nineteen',
      20 => 'twenty',
      30 => 'thirty',
      40 => 'forty',
      50 => 'fifty',
      60 => 'sixty',
      70 => 'seventy',
      80 => 'eighty',
      90 => 'ninety',
      100 => 'hundred',
      1000 => 'thousand',
      1000000 => 'million',
      1000000000 => 'billion',
      1000000000000 => 'trillion'
    }
    if self <= 20
      return words[self]
    elsif 20 < self && self < 100
      if self % 10 == 0
        return words[self]
      else
        return words[self/10 * 10] + " " + words[self % 10]
      end
    elsif 100 <= self && self < 1000
      if self % 100 == 0
        return words[self/100] + ' ' + words[100]
      else
        return words[self/100] + ' ' + words[100] + ' ' + (self % 100).in_words
      end
    elsif 1000 <= self && self < 1000000
      if self % 1000 == 0
        return (self/1000).in_words + ' ' + words[1000]
      else
        return (self/1000).in_words + ' ' + words[1000] + ' ' + (self % 1000).in_words
      end
    elsif 1000000 <= self && self < 1000000000
      if self % 1000000 == 0
        return (self/1000000).in_words + ' ' + words[1000000]
      else
        return (self/1000000).in_words + ' ' + words[1000000] + ' ' + (self % 1000000).in_words
      end
    elsif 1000000000 <= self && self < 1_000_000_000_000
      if self % 1000000000 == 0
        return (self/1000000000).in_words + ' ' + words[1000000000]
      else
        return (self/1000000000).in_words + ' ' + words[1000000000] + ' ' + (self % 1000000000).in_words
      end

    elsif 1_000_000_000_000 <= self && self < 1_000_000_000_000_000
      if self % 1000000000000 == 0
        return (self/1000000000000).in_words + ' ' + words[1000000000000]
      else
        return (self/1000000000000).in_words + ' ' + words[1000000000000] + ' ' + (self % 1000000000000).in_words
      end
    end
  end

end
