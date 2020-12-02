# Player class

BracketPair = Struct.new(:name, :open_pair, :close_pair)

class Linter
  attr_accessor :file_lines, :bracket_pair, :bracket_pairs

  def initialize(file)
    @file = file
    @file_lines = file.readlines.map(&:chomp)
    @bracket_pairs = [
      BracketPair.new('squiggly bracket', '{', '}'),
      BracketPair.new('parenthesis', '(', ')'),
      BracketPair.new('square brackes', '[', ']'),
      BracketPair.new('pipe', '|', '|'),
      BracketPair.new('double quote', '"', '"'),
      BracketPair.new('single quote', "\'", "\'")
    ]
    @bracket_pair = nil
  end

  def trailing_whitespace?(line)
    true if line[line.length - 1] == ' ' && line.length > 1
  end

  def missing_bracket_pair?(line)
    open_parenthesis = nil
    close_parenthesis = nil
    line.split(//).each do |item|
      @bracket_pairs.each_with_index do |i, index|
        if i.open_pair == item
          open_parenthesis = item
          @bracket_pair = index
        end
        close_parenthesis = item if i.close_pair == item
      end
    end
    return true if !open_parenthesis.nil? && close_parenthesis.nil?

    false
  end
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

file = File.open('player.rb')

linter = Linter.new(file)

linter.file_lines.each_with_index do |line, line_number|
  print_whitespace(line, line_number) if linter.trailing_whitespace?(line)
  if linter.missing_bracket_pair?(line)
    print_bracket_pair(line, line_number, linter.bracket_pairs[linter.bracket_pair].name)
  end
end
