def read_input(filename = 'input.txt')
  File.open(filename).readlines.map(&:chomp)
end
