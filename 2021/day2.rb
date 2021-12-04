require "./helpers"

data = read_input

# Part 1 - Not Fancy
results = { forward: 0, down: 0, up: 0 }
data.each { |i| results[i.split(' ')[0].to_sym] += i.split(' ')[1].to_i }
p (results[:down] - results[:up])*results[:forward]

# Part 1 - Medium Fancy
results = %w(forward down up).map do |key|
  data.grep(/#{key}/).map { |z| z.split(' ')[1].to_i }.sum
end
p results[0]*(results[1] - results[2])

# Part 2 - Not Fancy, Incremental
results = { depth: 0, forward: 0, aim: 0 }

data.each do |i|
  (direction, count) = i.split(' ')
  if direction == "down"
    results[:aim] += count.to_i
  elsif direction == "up"
    results[:aim] -= count.to_i
  elsif direction == "forward"
    results[:forward] += count.to_i
    results[:depth] += count.to_i*results[:aim]
  end
end

p (results[:depth])*results[:forward]
