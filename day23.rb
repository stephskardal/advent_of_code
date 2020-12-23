def part_1
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
end

########
# Definitely needed help on this one, brute force would have taken hours
########

def print_order(displayed, current, limit)
  printout = ""
  current_point = current
  while(printout.count('-') < limit)
    printout = "#{printout}-#{current_point}"
    current_point = displayed[current_point]
  end
  puts "#{printout.inspect} length #{displayed.keys.size}"
end

def part_2
  input = "459672813".chars.map(&:to_i)
  limit = 1000000
  input += (10..limit).to_a
  moves = 10000000

  # First, build mapping between all the cups
  mapped = {}
  input[0..limit].each_with_index do |number, i|
    mapped[number] = input[i == (limit - 1) ? 0 : i + 1]
  end
  current = input[0]

  moves.times do |move|
    puts move if move % 1_000_000 == 0

    # Build trio by cutting out mapping next / next / next from current
    three_pos = mapped[current]
    trio = []
    3.times do
      trio << three_pos
      three_pos = mapped[three_pos]
    end
    mapped[current] = three_pos

    value = current
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
    prev_dest = mapped[looking_for]
    mapped[trio.last] = prev_dest
    mapped[looking_for] = trio.first

    # And then iterate
    current = mapped[current]
    # print_order(mapped, current, limit)
  end
  puts "PART 2: #{mapped[1] * mapped[mapped[1]]}"
end

part_1
part_2
