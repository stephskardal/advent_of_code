require "./helpers"

data = read_input('input.txt')

removes = Regexp.new('\[\]|\(\)|<>|{}')
closes = Regexp.new('\]|\)|>|}')
bad_ones = []
incomplete = []

data.each do |row|
  length_changed = true
  while(length_changed) do
    old_length = row.length
    row.gsub!(removes, '')
    new_length = row.length
    length_changed = old_length != new_length
  end
  if row.match(closes)
    bad_ones << row
  else
    incomplete << row
  end
end

map = { ")": 3, "]": 57, "}": 1197, ">": 25137 }
sum = 0
bad_ones.each do |row|
  sum += map[row.split('').each_cons(2).to_a.select { |pair| pair[1].match(closes) }[0][1].to_sym]
end
p "Part 1: #{sum}"

reverse_it = { "(": ")", "[": "]", "{": "}", "<": ">" }
finish_map = { ")": 1, "]": 2, "}": 3, ">": 4 }
scores = []
incomplete.each do |row|
  sum = 0
  row.split('').map { |z| reverse_it[z.to_sym] }.reverse.each do |item|
    sum = sum*5 + finish_map[item.to_sym]
  end
  scores << sum
end
p "Part 2: #{scores.sort[scores.length/2]}"
