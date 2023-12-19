instructions = nil
hash = {}
File.foreach("Day08/Input.txt").with_index do |line,index|
    if index == 0
        instructions = line.delete("\n").split("")
        next
    end
    next if index == 1
    name = line.split("=")[0].delete(" ")
    side_nodes = line.split("=")[1].delete(" ()\n").split(",")
    hash[name] = side_nodes
end

at_this_node = "AAA"
number_of_moves = 0
while at_this_node != "ZZZ"
    index = number_of_moves
    while index >= instructions.size
        index -= instructions.size
    end
    if(instructions[index] == "L")
        at_this_node = hash[at_this_node][0]
    else
        at_this_node = hash[at_this_node][1]
    end
    number_of_moves += 1
end

p number_of_moves