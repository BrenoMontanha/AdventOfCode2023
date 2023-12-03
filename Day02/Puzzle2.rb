def prepare_game(str)
    a = str.split(/:/)
    return a[1]
end

sum = 0
File.foreach("Day02/Input.txt") {
    |line|
    game = prepare_game(line)
    sets = game.split(/;/)
    hash = {"red" => 0, "blue" => 0, "green" => 0}
    sets.each do |set|
        reveals = set.split(/,/)
        reveals.each do |reveal|
            reveal = reveal.split
            hash[reveal[1]] = [reveal[0].to_i, hash[reveal[1]]].max
        end
    end
    power = hash["red"] * hash["blue"] * hash["green"]
    sum += power
}

puts sum