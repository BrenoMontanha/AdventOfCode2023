class NumberAndPosition
  def initialize(value, first, last, line)
    @value = value
    @first = first
    @last = last
    @line = line
    @sum = false
  end

  def sumable(bool)
    @sum = bool
  end

  def sum?
    @sum
  end

  def value
    @value
  end

  def first
    @first
  end

  def last
    @last
  end

  def line
    @line
  end
end

class SymbolAndPosition
  def initialize(symbol, position, line)
    @symbol = symbol
    @position = position
    @line = line
  end

  def symbol
    @symbol
  end

  def check_surroundings(arrn)
    arrn.each{
        |number|
        if (number.line < (@line - 1))
            next
        end
        if(number.line > (@line + 1))
            break
        end
        if(some_in_interval((@position-1..@position+1),(number.first..number.last)))
            number.sumable(true)
        end
    }
  end

  def position
    @position
  end

  def line
    @line
  end
end

def some_in_interval(interval, r1)
  arr = r1.to_a
  arr.each{
    |pos|
    if(interval.cover?(pos))
        return true
    end
  }
  false
end

def number?(str)
    !!(str =~ /\d/)
end

def symbol?(str)
    not (("0".."9").cover? str or str =~ /[\.\n]/)
end

arrn = []
arrs = []

File.foreach("Day03/Input.txt").with_index{
    |line, indexl|
    chars = line.split('')
    number = ""
    firstp = nil
    lastp = nil
    chars.each_with_index{
        |char, index|
        if(number?(char))
            number << char
            lastp = index
            if(firstp.nil?)
                firstp = index;
            end
        else if(number.size>0)
            arrn << (NumberAndPosition.new(number.to_i, firstp, lastp, indexl))
            firstp = nil
            number = ""
            lastp = nil
        
        end
        end
        if(symbol?(char))
            arrs << (SymbolAndPosition.new(char, index, indexl))
        end
    }
}

arrs.each{
    |symbol|
    symbol.check_surroundings(arrn)
}

sum = 0
arrn.each{
    |number|
    if(number.sum?)
        sum += number.value
    end
}

puts sum

