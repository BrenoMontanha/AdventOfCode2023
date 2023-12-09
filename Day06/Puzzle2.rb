lines = File.read("Day06/Input.txt").split("\n")

mult = 1

time = lines[0].split(":")[1].delete(" ").to_i
distance = lines[1].split(":")[1].delete(" ").to_i

start_time = ((-time+Math.sqrt(time**2 - 4*distance))/(-2))
if(start_time%1 == 0)
    start_time += 1
end
start_time = start_time.ceil()
end_time =((-time-Math.sqrt(time**2 - 4*distance))/(-2))
if(end_time%1 == 0)
    end_time -= 1
end
end_time = end_time.floor()
time_pressed = (start_time..end_time)
ways_to_break_record = time_pressed.size()
mult *= ways_to_break_record

p mult

