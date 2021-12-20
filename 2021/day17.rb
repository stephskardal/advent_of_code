require "./helpers"

def step_through(velocity_x, velocity_y, max_x, min_y)
  points =[]
  steps = 0
  pos = [0,0]
  while(pos[1] > min_y && pos[0] < max_x) do
    new_pos = [pos[0] + velocity_x, pos[1] + velocity_y]

    # Change y velocity
    velocity_y = velocity_y - 1

    # Change x velocity
    if velocity_x > 0
      velocity_x -= 1
    elsif velocity_x < 0
      velocity_x += 1
    end

    points << new_pos
    pos = new_pos
  end

  points
end

def found_a_hit(points, ranges)
  return false if points.empty?

  last_point = points.last

  points.each do |point|
    if point[0] >= ranges[0][0] && point[0] <= ranges[0][1] && point[1] >= ranges[1][0] && point[1] <= ranges[1][1]
      # p "hit at #{point}"
      return true
      break
    end
  end

  return false
end

found = []

ranges = [[217,240],[-126,-69]]

count = 0
(0..ranges[0][1]).each do |x|
  (ranges[1][0]..ranges[1][0]*-1).each do |y|
    p = step_through(x, y, ranges[0][1], ranges[1][0])
    if found_a_hit(p, ranges)
      found = found + p
      count += 1
    end
  end
end
p "Part 1: #{found.map { |z| z[1] }.max}"
p "Part 2: #{count}"
