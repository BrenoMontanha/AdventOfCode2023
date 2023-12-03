def number?(char)
    !!(char =~ /[0-9]/)
  end
  
  sum = 0
  File.foreach("Day01/Input.txt") {
      |line|
      chars_of_line = line.chars
      first = nil
      last = nil
      chars_of_line.each do |letter|
          if(number?(letter))
              last = letter
              if(first.nil?)
                  first = letter;
              end
          end
      end
      sum += (first + last).to_i
  }
  
  puts sum