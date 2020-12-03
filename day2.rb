def part_1(data)
  yes = []
  data.each do |input|
    if input.match(/(.*)-(.*) (.*): (.*)/)
      if ($4.count($3) >= $1.to_i) && ($4.count($3) <= $2.to_i)
        yes << input
      end
    end
  end
  puts yes.size
end

def part_2(data)
  yes = []
  data.each do |input|
    if input.match(/(.*)-(.*) (.*): (.*)/)
      first_pos = $4.slice($1.to_i - 1) == $3
      second_pos = $4.slice($2.to_i - 1) == $3
      if (first_pos || second_pos) && !(first_pos && second_pos)
        yes << input
      end
    end
  end
  puts yes.size
end
