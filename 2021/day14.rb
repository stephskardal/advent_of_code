require "./helpers"

data = read_input('fake.txt')

@maps = data.select { |b| b.match(/ -> /) }.map { |z| z.split(" -> ") }.to_h
arr = data[0].split('')

@current_pairs = Hash.new(0)
@tallies = Hash.new(0)

@current_pairs.merge!(arr.each_cons(2).map(&:join).tally)
@tallies.merge!(arr.tally)

def calculate_diff
  @tallies.values.max - @tallies.values.min
end

# Needed help on part 2 b/c of computer power :)
40.times do |step|
  if step == 10
    puts "Part 1: #{calculate_diff}"
  end
  @current_pairs.clone.each do |pair, count|
    # Find lookup
    lookup = @maps[pair]

    # Tally lookup char
    @tallies[lookup] += count

    # Deduct from unsplit pair count
    @current_pairs[pair] -= count

    # Add to split pair, front and back
    @current_pairs[pair[0] + lookup] += count
    @current_pairs[lookup + pair[1]] += count
  end
end


puts "Part 2: #{calculate_diff}"
