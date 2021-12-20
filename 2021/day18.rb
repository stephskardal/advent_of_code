require "./helpers"

def magnitude(numbers)
  number_left = numbers[0]
  number_right = numbers[1]
  if(numbers[0].is_a?(Integer))
    if numbers[1].is_a?(Integer)
      # do nothing
    else
      number_right = magnitude(numbers[1])
    end
  elsif numbers[1].is_a?(Integer)
    number_left = magnitude(numbers[0])
  else
    number_left = magnitude(numbers[0])
    number_right = magnitude(numbers[1])
  end
  number_left*3+number_right*2
end

def try_reduction(str)
  can_reduce = true
  while(can_reduce) do
    result = reduce(str)
    if result == str
      can_reduce = false
    else
      str = result
    end
  end
  str
end

def reduce(str)
  matches = []
  str.scan(/([0-9][0-9]|\[{1}[0-9],[0-9]\]{1})/) do |c|
    matches << [c, $~.offset(0)[0]]
  end

  first_match = nil
  type = nil
  matches.each do |match, length|
    arr = str.split('')
    left_side = arr.shift(length).join('')
    match_length = match[0].split('').length
    right_side = arr.pop(str.length - length - match_length).join('')
    if match_length == 5 && (left_side.count('[') - left_side.count(']')) >= 4
      first_match = [left_side, match[0].gsub(/\[/, '').gsub(/\]/, ''), right_side]
      type = 'nest'
      break
    end
    if match_length == 2
      type = 'split'
      first_match = [left_side, match[0], right_side]
    end
  end

  return str if type.nil?

  if type == 'split'
    left = first_match[1].to_i/2.floor
    right = first_match[1].to_i/2.floor + (first_match[1].to_i%2 == 1 ? 1 : 0)
    divided = "[#{left},#{right}]"
    [first_match[0], divided, first_match[2]].join('')
  elsif type == 'nest'
    shift_left, shift_right = first_match[1].gsub(/\]/, '').gsub(/\[/, '').split(',').map(&:to_i)
    left_matches = first_match[0].scan(/(.*)([0-9])(.*)/).last
    if !left_matches.nil?
      insert_left = [left_matches[0], (left_matches[1].to_i + shift_left), left_matches[2]].join('')
    else
      insert_left = first_match[0]
    end

    right_matches = first_match[2].scan(/(.*?)([0-9])(.*)/).first
    if !right_matches.nil?
      insert_right = [right_matches[0], (right_matches[1].to_i + shift_right), right_matches[2]].join('')
    else
      insert_right = first_match[2]
    end

    [insert_left, "0", insert_right].join('')
  end
end

str = ["[[[[[9,8],1],2],3],4]", "[7,[6,[5,[4,[3,2]]]]]", "[[6,[5,[4,[3,2]]]],1]", "[[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]]", "[[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]]"]
str = ["[[[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]],[7,[[[3,7],[4,3]],[[6,3],[8,8]]]]]"]

str.each do |inside_str|
  result = try_reduction(inside_str)
  p "inside_str: #{inside_str} -> #{result}"
  #p magnitude(eval(result))
end

=begin
lines = read_input('fake2.txt')
#p lines
first = lines.shift
str = "#{first}"
while(lines.length > 0) do
  line = lines.shift
  str = "[#{str},#{line}]"
  p str
  result = try_reduction(str)
  p result
end
=end
