require_relative '../lib/linter'

def print_intro
  system('clear')
  puts 'Welcome to my linter!'
  puts 'To get started please put the code file you would like to lint in the "to_lint" folder'
  puts 'afterwards, please input the name of the code file below!'
  puts ''
end

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

print_intro
file_input = gets.chomp
file = File.open("./to_lint/#{file_input}")

linter = Linter.new(file)
bracket_linter = linter.bracket_linter
indentation_linter = linter.indentation_linter
system('clear')

linter.file_lines.each_with_index do |line, line_number|
  print_whitespace(line, line_number) if linter.trailing_whitespace?(line)
  print_indentation(line, line_number) if indentation_linter.check_indentation(line)
  next unless linter.missing_brackets?(line)

  name_of_bracket_pair = bracket_linter.bracket_pairs[bracket_linter.pair_index].name
  print_bracket_pair(line, line_number, name_of_bracket_pair)
end
