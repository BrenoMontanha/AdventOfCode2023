
def minimum(a, b)
    if a < b
        return a
    end
    return b
end

min = nil
hash = {}

file_data = File.read("Day05/Example.txt").split("\n\n")
file_data.each_with_index{
    |data, index|
    block = data.split(":")
    lines = block[1].split("\n")
    p lines
    arr = []
    lines.each{
        |line|
        hash_data_position = {}
        next if line.empty?
        values = line.split.map(&:to_i)
        if(index == 0)
            start = nil
            range = nil
            values.each_with_index{
                |value, indexv|
                if(indexv%2 == 0)
                    start = value
                else
                    range = value
                    arr << (start...start+range)
                end
            }
        else
            p "#{values[1]} => #{values[0]}...#{values[0]+values[2]}"
            hash_data_position = hash_data_position.merge({values[1] => values[0]...values[0]+values[2]})
            arr << hash_data_position
        end
        hash = hash.merge({block[0] => arr})
    }
}

p min