def all_parts(data, right_shift = 3, down_shift = 1)
  line_length = data.first.length
  pos = 0
  hits = []

  data.each_with_index do |line, index|
    if index % down_shift == 0
      hits << line.slice(pos)
      pos += right_shift
      pos -= (line_length) if pos >= line_length
    end
  end

  puts hits.count('#')
end
