require_relative 'bracket_pair'
require_relative 'indentation'

class Linter
  attr_accessor :file_lines, :bracket_linter, :indentation_linter

  def initialize(file)
    @file = file
    @file_lines = file.readlines.map(&:chomp)
    @bracket_linter = BracketPairModule.new
    @indentation_linter = IndentationModule.new
  end

  def trailing_whitespace?(line)
    true if line[line.length - 1] == ' ' && line.length > 1
  end

  def missing_brackets?(line)
    @bracket_linter.missing_bracket_pair?(line)
  end

  def missing_indentation?(line)
    @indentation_linter.check_indentation(line)
  end
end
