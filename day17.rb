def prepare_4d(data)
  mapped = {}
  data.each_with_index do |x, x_index|
    x.each_with_index do |y, y_index|
      mapped[[x_index, y_index, 0, 0]] = y
    end
  end
  mapped
end

def prepare_3d(data)
  mapped = {}
  data.each_with_index do |x, x_index|
    x.each_with_index do |y, y_index|
      mapped[[x_index, y_index, 0]] = y
    end
  end
  mapped
end

def inputs
"#####...
.#..##..
##.##.##
...####.
#.#...##
.##...#.
.#.#.###
#.#.#..#".split("\n").map(&:chars)
end

def update_seat_3d(seats, x, y, z)
  count = 0
  (x-1..x+1).each do |xx|
    (y-1..y+1).each do |yy|
      (z-1..z+1).each do |zz|
        next if (xx == x && yy == y && zz == z)
        count += 1 if seats[[xx, yy, zz]] == "#"
      end
    end
  end

  if ([2, 3].include?(count) && seats[[x, y, z]] == "#") || (count == 3 && (seats[[x, y, z]] == "." || seats[[x, y, z]].nil?))
    "#"
  else
    "."
  end
end

def update_seat_4d(seats, x, y, z, a)
  count = 0
  (x-1..x+1).each do |xx|
    (y-1..y+1).each do |yy|
      (z-1..z+1).each do |zz|
        (a-1..a+1).each do |aa|
          next if (xx == x && yy == y && zz == z && aa == a)
          count += 1 if seats[[xx, yy, zz, aa]] == "#"
        end
      end
    end
  end

  if ([2, 3].include?(count) && seats[[x, y, z, a]] == "#") || (count == 3 && (seats[[x, y, z, a]] == "." || seats[[x, y, z, a]].nil?))
    "#"
  else
    "."
  end
end

def part_1
  data = inputs
  mapped = prepare_3d(data)
  cycle = 0
  while(cycle < 6) do
    new_map = {}
    dimension = inputs.first.size
    ((-1*cycle - dimension)..(cycle + dimension)).each do |x|
      ((-1*cycle - dimension)..(cycle + dimension)).each do |y|
        (-10..10).each do |z|
          new_map[[x, y, z]] = update_seat_3d(mapped, x, y, z)
        end
      end
    end
  
    mapped = new_map
    cycle += 1
    puts "Cycle: #{cycle} - Total #{mapped.values.count('#')}"
  end
end

def part_2
  data = inputs
  mapped = prepare_4d(data)
  cycle = 0
  while(cycle < 6) do
    new_map = {}
    dimension = inputs.first.size
    # range is determined by cycle
    ((-1*cycle - dimension)..(cycle + dimension)).each do |x|
      ((-1*cycle - dimension)..(cycle + dimension)).each do |y|
        ((-1*cycle - 1)..(cycle + 1)).each do |z|
          ((-1*cycle - 1)..(cycle + 1)).each do |a|
            new_map[[x, y, z, a]] = update_seat_4d(mapped, x, y, z, a)
          end
        end
      end
    end
  
    mapped = new_map
    cycle += 1
    puts "Cycle: #{cycle} - Total #{mapped.values.count('#')}"
  end
end

part_1
part_2
