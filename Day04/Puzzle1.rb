
sum = 0
File.foreach("Day04/Input.txt"){
    |line|
    game = line.split(":")[1].split("|")
    game_points = 0 
    winning_numbers = game[0].split
    numbers_you_have = game[1].split
    winning_numbers.each{
        |winning_number|
        numbers_you_have.each{
            |number_you_have|
            if(number_you_have == winning_number)
                if(game_points == 0)
                    game_points = 1
                else
                    game_points *= 2
                end
                break
            end
        }
    }
    sum += game_points
}

puts sum