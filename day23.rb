input = "459672813".chars.map(&:to_i)
position = 0
value = input.first

# puts "MOVE 1: cups start #{input.map { |z| z == value ? "(#{z})" : z}.join(' ')}"
100.times do |move|
  position = input.index(value)
  trio = input.slice!(position + 1, 3)
  if trio.length < 3
    trio += input.slice!(0, 3 - trio.length)
  end
  # puts "pick up: #{trio.inspect}"
  examining = position
  found = false
  looking_for = case
                when (trio & [value-1, value-2, value-3]).size == 3
                  value - 4
                when (trio & [value-1, value-2]).size == 2
                  value - 3
                when (trio & [value-1]).size == 1
                  value - 2
                else
                  value - 1
                end
  looking_for = input.select { |z| z != value }.max if looking_for == 0
  examining = input.index(looking_for)

  input.insert(examining + 1, trio).flatten!
  value = input[input.index(value) == input.size - 1 ? 0 : (input.index(value) + 1)]
  # puts "MOVE #{move + 2}: now cups: #{input.map { |z| z == value ? "(#{z})" : z}.join(' ')}" if move != 9 && move != 99
end

while(input.first != 1) do
  input << input.shift
end
puts "PART 1 cups: #{input[1..].join('')}"

########
# Definitely needed help on this one, brute force would have taken hours
########

input = "459672813".chars.map(&:to_i)
limit = 1000000
position = 0
value = input.first
input += (10..limit).to_a
moves = 10000000

# First, build crazy mapping between all the cups, WTF
current = { label: input[0] }
mapped = { input[0] => current  }
current[:next] = current
last = current
head = current
input[1..limit].each do |number|
  cup_node = {
    label: number,
  }
  mapped[number] = cup_node
  cup_node[:next] = head
  last[:next] = cup_node
  last = cup_node
end

moves.times do |move|
  puts move if move % 1_000_000 == 0

  # First, build trio by cutting out mapping next / next / next from current
  three_pos = current[:next]
  trio = []
  3.times do
    trio << three_pos[:label]
    three_pos = three_pos[:next]
  end
  current[:next] = mapped[three_pos[:label]]

  value = current[:label]
  looking_for = case
                when (trio & [value-1, value-2, value-3]).size == 3
                  value - 4
                when (trio & [value-1, value-2]).size == 2
                  value - 3
                when (trio & [value-1]).size == 1
                  value - 2
                else
                  value - 1
                end
  looking_for = input.select { |z| z != value }.max if looking_for == 0

  # Then, insert trio into destination / next and adjust trio list to point to destination[:next]
  dest = mapped[looking_for]
  mapped[trio.last][:next] = dest[:next]
  dest[:next] = mapped[trio.first]

  # And then iterate
  current = current[:next]
end

puts "PART 2: #{mapped[1][:next][:label] * mapped[1][:next][:next][:label]}"
