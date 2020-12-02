# Player class

BracketPair = Struct.new(:open, :close)

class Linter
  attr_accessor :file_lines

  def initialize(file)
    @file = file
    @file_lines = file.readlines.map(&:chomp)
  end
  @bracket_pairs = [
    BracketPair.new('{', '}'),
    BracketPair.new('(', ')'),
    BracketPair.new('[', ']'),
    BracketPair.new('|', '|'),
    BracketPair.new('"', '"'),
    BracketPair.new("\'", "\'")
  ]
  def trailing_whitespace?(line)
    true if line[line.length - 1] == ' ' && line.length > 1
  end

  def missing_parenthesis?(line)
    open_parenthesis = nil
    close_parenthesis = nil
    line.split(//).each do |item|
      open_parenthesis = item if item == '('
      close_parenthesis = item if item == ')'
    end
    return true if open_parenthesis == '(' && close_parenthesis.nil?

    false
  end
end

def print_whitespace(line, line_number)
  puts "Trailing whitespace detected on line #{line_number + 1}"
  puts "Line #{line_number + 1}: #{line} <-"
  puts ''
end

def print_parenthesis(line, line_number)
  puts "Missing parenthesis on line #{line_number + 1}"
  puts "Line #{line_number + 1}: #{line} <-"
  puts ''
end

file = File.open('player.rb')

linter = Linter.new(file)

linter.file_lines.each_with_index do |line, line_number|
  print_whitespace(line, line_number) if linter.trailing_whitespace?(line)
  print_parenthesis(line, line_number) if linter.missing_parenthesis?(line)
end
