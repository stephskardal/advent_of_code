require "./helpers"

data = read_input('input.txt')
p "Part 1: #{data.map { |b| b.split(' | ')[1] }.join(" ").split(" ").select { |b| [2, 3, 4, 7].include?(b.length) }.count}"

def decode_line(inputs, line)
  solved = {}
  { 2 => 1, 3 => 7, 4 => 4, 7 => 8 }.each do |key, value|
    a, inputs = inputs.partition { |b| b.length == key }
    solved[value] = a[0]
  end
  # Biz logic via intersections
  a, inputs = inputs.partition { |b| b.length == 6 && (solved[1].split('').intersection(b.split(''))).length == 1 }
  solved[6] = a[0]
  a, inputs = inputs.partition { |b| b.length == 5 && (solved[1].split('').intersection(b.split(''))).length == 2 }
  solved[3] = a[0]
  a, inputs = inputs.partition { |b| b.length == 5 && (solved[6].split('').intersection(b.split(''))).length == 5 }
  solved[5] = a[0]
  a, inputs = inputs.partition { |b| b.length == 5 }
  solved[2] = a[0]
  a, inputs = inputs.partition { |b| solved[5].split('').intersection(b.split('')).length == 5 }
  solved[9] = a[0]
  solved[0] = inputs[0]
  reversed = solved.invert
  line.split(' | ')[1].split(' ').map { |d| reversed[d.split('').sort.join('')] }.join('').to_i
end

data = read_input('input.txt')
sum = data.map do |line|
  decode_line(line.gsub(/ \| /, ' ').split(" ").map { |z| z.split('').sort.join('') }.uniq, line)
end.inject(0, :+)
p "Part 2: #{sum}"
