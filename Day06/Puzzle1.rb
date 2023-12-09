lines = File.read("Day06/Input.txt").split("\n")

mult = 1

times = lines[0].split(":")[1].split.map(&:to_i)
distances = lines[1].split(":")[1].split.map(&:to_i)

for i in (0...distances.length())
  start_time = ((-times[i]+Math.sqrt(times[i]**2 - 4*distances[i]))/(-2))
  if(start_time%1 == 0)
    start_time += 1
  end
  start_time = start_time.ceil()
  end_time =((-times[i]-Math.sqrt(times[i]**2 - 4*distances[i]))/(-2))
  if(end_time%1 == 0)
    end_time -= 1
  end
  end_time = end_time.floor()
  time_pressed = (start_time..end_time)
  ways_to_break_record = time_pressed.size()
  mult *= ways_to_break_record
end

p mult

