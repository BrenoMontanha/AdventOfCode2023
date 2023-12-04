sum = 0

class Game
    def initialize(winning_numbers, numbers_you_have)
        @winning_numbers = winning_numbers
        @numbers_you_have = numbers_you_have
        @game_points = 0
    end

    def calcule_game_points
        @winning_numbers.each{
            |winning_number|
            @numbers_you_have.each{
                |number_you_have|
                if(number_you_have == winning_number)
                    @game_points += 1
                    break
                end
            }
        }
        return @game_points
    end
end


arrcopies = Array.new

File.foreach("Day04/Input.txt").with_index{
    |line, index|
    preparing_game = line.split(":")[1].split("|")
    game = Game.new(preparing_game[0].split, preparing_game[1].split)
    points = game.calcule_game_points
    if(arrcopies[index].nil?)
        arrcopies << 0
    end
    for i in (index+1..index+points)
        if(arrcopies[i].nil?)
        arrcopies << 0
        end
        arrcopies[i] += (arrcopies[index]+1)
    end
    
}

arrcopies.each{
    |how_many|
    sum += how_many+1
}

puts sum