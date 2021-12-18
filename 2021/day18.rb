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
  split_match_index = nil
  nested_match_index = nil

  split_matches = str.scan(/([0-9][0-9])/)
  split_match = nil
  split_matches.each do |match|
    split = str.split(match[0], 2)
    if split[0].count('[') >= 4 && split[1].count(']') >= 4
      split_match_index = split[0].length
      split_match = [split[0], match[0], split[1]]
      break
    end
  end

  nested_matches = []
  str.scan(/(\[[0-9],[0-9]\])/) do |c|
    nested_matches << [c, $~.offset(0)[0]]
  end

  nested_match = nil
  nested_matches.each do |match, length|
    arr = str.split('')
    z = arr.shift(length).join('')
    r = arr.pop(str.length - length - 5).join('')
    split = [z, r]
    if (split[0].count('[') - split[0].count(']')) >= 4 && split[1].count(']') >= 4
      nested_match_index = split[0].length
      nested_match = [split[0], match[0].gsub(/\[/, '').gsub(/\]/, ''), split[1]]
      break
    end
  end

  type = nil

  # get priority left
  if !split_match.nil? && !nested_match.nil?
    type = 'split'
    type = 'nest' if nested_match_index <= split_match_index
  elsif !split_match.nil?
    type = 'split'
  elsif !nested_match.nil?
    type = 'nest'
  end

  return str if type.nil?

  if type == 'split'
    left = split_match[1].to_i/2.floor
    right = split_match[1].to_i/2.floor + (split_match[1].to_i%2 == 1 ? 1 : 0)
    divided = "[#{left},#{right}]"
    [split_match[0], divided, split_match[2]].join('')
  elsif type == 'nest'
    shift_left, shift_right = nested_match[1].gsub(/\]/, '').gsub(/\[/, '').split(',').map(&:to_i)
    left_matches = nested_match[0].scan(/(.*)([0-9])(.*)/).last
    if !left_matches.nil?
      insert_left = [left_matches[0], (left_matches[1].to_i + shift_left), left_matches[2]].join('')
    else
      insert_left = nested_match[0]
    end

    right_matches = nested_match[2].scan(/(.*?)([0-9])(.*)/).first
    if !right_matches.nil?
      insert_right = [right_matches[0], (right_matches[1].to_i + shift_right), right_matches[2]].join('')
    else
      insert_right = nested_match[2]
    end

    [insert_left, "0", insert_right].join('')
  end
end

str = ["[[[[[9,8],1],2],3],4]", "[7,[6,[5,[4,[3,2]]]]]", "[[6,[5,[4,[3,2]]]],1]", "[[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]]", "[[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]]"]
str = ["[[[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]],[7,[[[3,7],[4,3]],[[6,3],[8,8]]]]]"]
#str = ["[[[[4,0],[5,4]],[[7,7],[6,0]]],[[[6,6],[0,5]],[[5,6],[6,[[7,7],8]]]]]"]
#str = ["[[[[4,0],[5,4]],[[7,7],[6,0]]],[[[6,6],[0,[5,5]]],[[0,6],[6,[7,15]]]]]"]
#str = ["[[[[[6,6],[7,7]],[[0,7],[7,7]]],[[[5,5],[5,6]],9]],[1,[[[9,3],9],[[9,0],[0,7]]]]"]

str.each do |inside_str|
  result = try_reduction(inside_str)
  "inside_str: #{inside_str} -> #{result}"
  p magnitude(eval(result))
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
