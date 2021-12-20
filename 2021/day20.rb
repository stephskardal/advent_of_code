require "./helpers"

data = read_input('input.txt')

boards = create_boards(data)
algo = boards.shift.join('').gsub(/\./, '0').gsub(/#/, '1').split('')
image = boards.shift.map { |z| z[0].gsub(/\./, '0').gsub(/#/, '1').split('') }

mapped_algo = []
algo.each_with_index do |value, index|
  mapped_algo << (index).to_s(2).rjust(9, "0") if value == "1"
end

p "Starting value: #{image.flatten(2).count("1")}"

rounds = 50
(1..rounds).each do |round|
  pad = round%2 == 1 ? "0" : "1"
  image = pad_board(image, pad)
  image = pad_board(image, pad)

  rows = image.size
  cols = rows
  new_image = Array.new(rows){Array.new(cols, pad)}
  (1..rows - 2).each do |row|
    (1..cols - 2).each do |col|
      neighbors = []
      (row-1..row+1).each do |inner_row|
        (col-1..col+1).each do |inner_col|
          neighbors << image[inner_row][inner_col]
        end
      end
      str = neighbors.join('')
      if mapped_algo.include?(str)
        new_image[row][col] = "1"
      else
        new_image[row][col] = "0"
      end
    end
  end

  new_image.shift
  new_image.pop
  new_image.each do |row|
    row.pop
    row.shift
  end

  image = new_image
  #print_board(new_image)
  p "Round: #{round}: #{new_image.flatten(2).count("1")}"
end
