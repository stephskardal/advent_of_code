require "./helpers"

data = read_input('input.txt')[0].split(',').map(&:to_i)
counts = data.each_with_object(Hash.new(0)) { |ages, counts| counts[ages] += 1 }
b = counts.keys.sort

sum_map = {}
sum_map["0"] = 0
factorial = 0
(1..data.max + 1).each do |number|
  factorial = factorial+number
  sum_map[number.to_s] = factorial
end

# Part 1
q = b.map { |z| counts.map { |key, value| (key - z).abs*value }.inject(0, :+) }
p "Part 1: #{q.min}"

# Part 2
q = b.map { |z| counts.map { |key, value| sum_map[(key - z).abs.to_s]*value }.inject(0, :+) }
p "Part 2: #{q.min}"
