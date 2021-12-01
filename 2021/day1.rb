require "./read_file"

data = read_input

# Part 1
p data.map(&:to_i).each_cons(2).select { |b| b[1] > b[0] }.size

# Part 2
p data.map(&:to_i).each_cons(3).map(&:sum).each_cons(2).select { |b| b[1] > b[0] }.size
