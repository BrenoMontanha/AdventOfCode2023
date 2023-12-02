# def identify_game_id_and_prepare_game(str)
def prepare_game(str)
    a = str.split(/:/)
    # a[0].gsub!(/\D/, "")
    # return a[0].to_i , a[1]
    return a[1]
end

# def not_in_range?(hash)
#     redm = 12
#     bluem = 14
#     greenm = 13
# 
#     hash["red"] > redm || hash["blue"] > bluem || hash["green"] > greenm
# end

sum = 0
File.foreach("AdventOfCode2DayInput.txt") {
    |line|
    # game_id, game = identify_game_id_and_prepare_game(line)
    game = prepare_game(line)
    sets = game.split(/;/)
    # add = true
    hash = {"red" => 0, "blue" => 0, "green" => 0}
    sets.each do |set|
        # hash = {"red" => 0, "blue" => 0, "green" => 0}
        reveals = set.split(/,/)
        reveals.each do |reveal|
            reveal = reveal.split
            # hash[reveal[1]] += reveal[0].to_i
            hash[reveal[1]] = [reveal[0].to_i, hash[reveal[1]]].max
        end
        
        # if(not_in_range?(hash))
        #    add = false
        # end
        
    end
    power = hash["red"] * hash["blue"] * hash["green"]
    sum += power
    # if(add)
    #     sum += game_id
    # end
}

puts sum