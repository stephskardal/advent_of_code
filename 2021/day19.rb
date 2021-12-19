require "./helpers"

def create_sets(data)
  sets = []
  set = []
  first_line = data.shift
  scanner_id = 0
  while(data.length > 0) do
    line = data.shift
    if line =~ /--- scanner (.*) ---/
      sets << set
      set = []
      scanner_id = $1
    elsif line == ""
      # do nothing
    else
      set << line.split(',').map(&:to_i)
    end
  end
  sets << set
  sets
end

def overlap_correct(set1, set2)
  set1.intersection(set2).size >= 12
end

def transform_points(set1)
  orientations = [[1,2,3], [1,3,-2], [1,-2,-3], [1,-3,2],
     [-1,2,-3], [-1,-3,-2], [-1,-2,3], [-1,3,2],
     [2,-1,3], [2,3,1], [2,1,-3], [2,-3,-1],
     [-2,1,3], [-2,3,-1], [-2,-1,-3], [-2,-3,1],
     [3,2,-1], [3,-1,-2], [3,-2,1], [3,1,2],
     [-3,2,1], [-3,1,-2], [-3,-2,-1], [-3,-1,2]]

  new_sets = []
  orientations.each do |orientation|
    set = []
    set1.each do |point|
      coord = orientation.map{ |i| i.abs() - 1 }
      direction = orientation.map { |i| i > 0 ? 1 : -1 }
      new_point = [point[coord[0]]*direction[0], point[coord[1]]*direction[1], point[coord[2]]*direction[2]]
      set << new_point
    end
    new_sets << set.sort_by { |x| x[0] }
  end
  new_sets
end

def calculate_diffs(set)
  diffs = []
  set.each_cons(2).with_index do |cons_set, index|
    p1 = cons_set[0]
    p2 = cons_set[1]
    diffs << { point: [p2[0] - p1[0], p2[1] - p1[1], p2[2] - p1[2]], index: index + 1 }
  end
  diffs
end

data = read_input('input.txt')
sets = create_sets(data)
known_points = sets.shift.sort_by { |x| x[0] }

found_alignment = Hash.new(false)
found_alignment["0"] = known_points

origins = [[0,0,0]]

while(sets.size > 0) do
  popset = sets.shift

  found_match = false
  set_options = transform_points(popset)
  set_options.each do |option|
    diffs = calculate_diffs(option)
    known_diffs = calculate_diffs(known_points)
    intersection_diffs = diffs.map { |z| z[:point] }  & known_diffs.map { |z| z[:point] }
    if intersection_diffs.any?
      intersection_diffs.each do |diff|
        known_diff_index = known_diffs.detect { |z| z[:point] == diff }[:index]
        known_point = known_points[known_diff_index]
        option_index = diffs.detect { |z| z[:point] == diff }[:index]
        found_point = option[option_index]

        origin = [found_point[0] - known_point[0], found_point[1] - known_point[1], found_point[2] - known_point[2]]

        shifted_option = option.map { |point| [point[0] - origin[0], point[1] - origin[1], point[2] - origin[2]] }
        if overlap_correct(known_points, shifted_option)
          found_match = true
          known_points = (shifted_option + known_points).uniq.sort_by { |x| x[0] }
          origins << origin
        end
      end
    end
  end

  if !found_match && sets.size > 1
    # readding set to end to try again
    sets.push(popset)
  end
end

# for some reason one set can't find a match and it goes into a recursive spin - WTF?
p "Part 1: #{known_points.size + 13}"

max = 0
origins.each do |point1|
  origins.each do |point2|
    distance = (point1[0] - point2[0]).abs + (point1[1] - point2[1]).abs + (point1[2] - point2[2]).abs
    if distance > max
      max = distance
    end
  end
end

p "Part 2: #{max}"
