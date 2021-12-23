require "./helpers"

data = read_input('fake.txt')

@inputs = []
data.map do |z|
  l, r = z.split(' ')
  l = l == "on"
  inner = r.split(',').map { |i| i.split('=') }.map { |z| z[1].split('..').map(&:to_i) }
  @inputs << [l, inner]
end

# Part 1
switches = Hash.new(false)

=begin
inputs.each do |input|
  x, y, z = input[1]
  all_dimensions = [x, y, z].flatten
  next if all_dimensions.any? { |d| d.abs > 50 }

  result = (x[0]..x[1]).to_a.product((y[0]..y[1]).to_a, (z[0]..z[1]).to_a)
  result.each do |x, y, z|
    switches["#{x}-#{y}-#{z}"] = input[0]
  end
end

p "Part 1: #{switches.values.count(true)}"
=end

part_2 = Hash.new(false)

@inputs.each do |input|
  # do fit
  part_2[input] = true if input[0]
  p input
end

#p part_2.keys.sum(&:volume)
