BracketPair = Struct.new(:name, :open_pair, :close_pair)

class Linter
  attr_accessor :file_lines, :bracket_pair, :bracket_pairs

  def initialize(file)
    @file = file
    @file_lines = file.readlines.map(&:chomp)

    @bracket_pairs = [
      BracketPair.new('squiggly bracket', '{', '}'),
      BracketPair.new('parenthesis', '(', ')'),
      BracketPair.new('square bracket', '[', ']'),
      BracketPair.new('pipe', '|', '|'),
      BracketPair.new('double quote', '"', '"'),
      BracketPair.new('single quote', "\'", "\'")
    ]
    @bracket_pair = nil
    @open_bracket = nil
    @close_bracket = nil

    @indent_counter = 0
    @keywords = %w[def class if else]
  end

  def trailing_whitespace?(line)
    true if line[line.length - 1] == ' ' && line.length > 1
  end

  def missing_bracket_pair?(line)
    @open_bracket = nil
    @close_bracket = nil
    line.split(//).each do |item|
      check_pair(item)
    end
    return true if !@open_bracket.nil? && @close_bracket.nil?

    false
  end

  def check_indentation(line)
    add_to_counter = 0
    line_arr = line.split(/ /)
    line_arr.each do |word|
      if indent_counter(word) > 0
        add_to_counter = indent_counter(word)
        break
      end
      if word == 'end'
        @indent_counter -= 2
        add_to_counter = 0
        break
      end
      
    end
    @indent_counter.negative? ? 0 : @indent_counter
    if !line_arr[0..@indent_counter].all?('') && @indent_counter > 0
      puts "Missing indentation on line #{line}"
    end
    @indent_counter += add_to_counter
  end

  private

  def indent_counter(word)
    ret_val = 0
    @keywords.each do |keyword|
      if word == keyword
        @indent_counter.zero? ? (ret_val = 1) : (ret_val = 2)
        break
      end
    end
    ret_val
  end

  def check_pair(item)
    @bracket_pairs.each_with_index do |i, index|
      if i.open_pair == item && @open_bracket.nil?
        @open_bracket = item
        @bracket_pair = index
        next
      end
      next unless i.close_pair.eql? item

      @close_bracket = item
    end
  end

end
