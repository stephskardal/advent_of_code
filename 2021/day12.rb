require "./helpers"

data = read_input('input.txt')

@connections = {}

data.each do |line|
  part1, part2 = line.split('-')
  @connections[part1] ||= []
  @connections[part1] << part2
  @connections[part2] ||= []
  @connections[part2] << part1
end

def valid_option(path, part)
  counting = path.select { |k| k != "start" && k != "end" && k.match(/^[A-Z]*$/).nil? }
  counts = counting.inject(Hash.new(0)){|p,v| p[v]+=1; p}

  if part == "part_1"
    !(counts.values.count(2) > 0)
  else
    !(counts.values.count(3) == 1 || counts.values.count(2) > 1)
  end
end

def find_paths_to_end(point, path, part)
  if point == "end"
    @all_paths << path.dup + ["end"]
  else
    @connections[point].select { |j| j != "start" }.each do |new_point|
      new_option = path.dup + [new_point]
      if valid_option(new_option, part)
        find_paths_to_end(new_point, new_option, part)
      end
    end
  end
end

@all_paths = []
find_paths_to_end("start", ["start"], "part_1")
p "Part 1: #{@all_paths.size}"

@all_paths = []
find_paths_to_end("start", ["start"], "part_2")
p "Part 2: #{@all_paths.size}"
