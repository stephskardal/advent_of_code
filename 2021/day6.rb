require "./helpers"

data = read_input('input.txt')

# Part 1 & 2 - Bonus!
counts = data[0].split(',').map(&:to_i).each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }

(0..255).each do |day|
  updated_counts = (0..8).to_a.inject({}) { |b, a| b[a] = 0; b}
  counts.each do |key, value|
    if key == 0
      updated_counts[8] = value
      updated_counts[6] += value
    else
      updated_counts[key - 1] += value
    end
  end
  counts = updated_counts
  if day == 79
    p "Part 1: #{counts.values.inject(0, :+)}"
  end
end

p "Part 2: #{counts.values.inject(0, :+)}"
