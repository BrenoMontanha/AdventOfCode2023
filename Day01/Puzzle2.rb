def number?(char)
  !!(char =~ /[0-9]/)
end

def tratamento(str)
    str.gsub!("one", "o1e")
    str.gsub!("two", "t2o")
    str.gsub!("three", "t3e")
    str.gsub!("four", "4")
    str.gsub!("five", "5e")
    str.gsub!("six", "6")
    str.gsub!("seven", "7n")
    str.gsub!("eight", "e8t")
    str.gsub!("nine", "n9e")
    str.gsub!(/\D/, "")
end

sum = 0
File.foreach("Day01/Input.txt") {
    |line|
    tratamento(line)
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