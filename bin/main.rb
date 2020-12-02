require_relative '../lib/linter'

def print_whitespace(line, line_number)
  puts "Trailing whitespace detected on line #{line_number + 1}"
  puts "Line #{line_number + 1}: #{line} <-"
  puts ''
end

def print_bracket_pair(line, line_number, bracket_pair)
  puts "Missing ending #{bracket_pair} on line #{line_number + 1}"
  puts "Line #{line_number + 1}: #{line} <-"
  puts ''
end

def print_indentation(line, line_number)
  puts "Incorrect indentation on line #{line_number + 1}"
  puts "Line #{line_number + 1}: #{line} <-"
  puts ''
end

file = File.open('C:/Users/Janluc/Desktop/Programming/Microverse/Ruby/TestFiles/lib/player.rb')

linter = Linter.new(file)
bracket_linter = linter.bracket_linter
indentation_linter = linter.indentation_linter

linter.file_lines.each_with_index do |line, line_number|
  print_whitespace(line, line_number) if linter.trailing_whitespace?(line)
  print_indentation(line, line_number) if indentation_linter.check_indentation(line)
  next unless linter.missing_brackets?(line)

  name_of_bracket_pair = bracket_linter.bracket_pairs[bracket_linter.pair_index].name
  print_bracket_pair(line, line_number, name_of_bracket_pair)
end


