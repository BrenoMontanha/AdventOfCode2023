class Seed
    def initialize(seed)
        @seed = seed
    end

    def get_seed
        @seed
    end

    def set_soil(seed, str)
        @soil = corresponds(seed, str)
    end

    def get_soil
        @soil
    end

    def set_fertilizer(soil, str)
        @fertilizer = corresponds(soil, str)
    end

    def get_fertilizer
        @fertilizer
    end

    def set_water(fertilizer, str)
        @water = corresponds(fertilizer, str)
    end

    def get_water
        @water
    end

    def set_light(water, str)
        @light = corresponds(water, str)
    end

    def get_light
        @light
    end

    def set_temperature(light, str)
        @temperature = corresponds(light, str)
    end

    def get_temperature
        @temperature
    end

    def set_humidity(temperature, str)   
        @humidity = corresponds(temperature, str)
    end

    def get_humidity
        @humidity
    end

    def set_location(humidity, str)
        @location = corresponds(humidity,str)
    end

    def get_location
        @location
    end
end

def corresponds(value, str)
    arr = str.split("\n")
    arr.each{
        |line|
        if(!line.empty?)
            dados = line.split.map(&:to_i)
            if(value>=dados[1] && value<dados[1]+dados[2])
                return dados[0] + (value-dados[1])
            end
        end
    }
    return value

end

def minimum(a, b)
    if a < b
        return a
    end
    return b
end

file_data = File.read("Day05/Input.txt").split("\n\n")

file_data.each_with_index{
    |map, index|
    file_data[index] = map.split(":")[1]
}
seeds_data = file_data[0].split.map(&:to_i)
seeds = []
seeds_data.each{
    |seed|
    seeds << Seed.new(seed)
}
seeds.each{
    |seed|
    seed.set_soil(seed.get_seed, file_data[1])
    seed.set_fertilizer(seed.get_soil, file_data[2])
    seed.set_water(seed.get_fertilizer, file_data[3])
    seed.set_light(seed.get_water, file_data[4])
    seed.set_temperature(seed.get_light, file_data[5])
    seed.set_humidity(seed.get_temperature, file_data[6])
    seed.set_location(seed.get_humidity, file_data[7])
}

min = nil
seeds.each{
    |seed|
    if(min.nil?)
        min = seed.get_location;
    else
        min = minimum(min, seed.get_location)
    end
}

p min