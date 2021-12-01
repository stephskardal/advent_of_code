def read_input # Rigid assumption it's called input.txt
  File.open('input.txt').readlines.map(&:chomp)
end
