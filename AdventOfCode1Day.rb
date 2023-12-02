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

soma = 0
File.foreach("AdventOfCode1DayInput.txt") {
    |line|
    tratamento(line)
    linha = line.chars
    first = nil
    last = nil
    linha.each do |letra|
        if(number?(letra))
            last = letra
            if(first.nil?)
                first = letra;
            end
        end
    end
    soma += (first + last).to_i
}

puts soma