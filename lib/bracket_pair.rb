BracketPair = Struct.new(:name, :open_pair, :close_pair)

class BracketPairModule
  attr_accessor :bracket_pairs, :pair_index
  attr_reader :open_bracket, :close_bracket

  def initialize
    @bracket_pairs = [
      BracketPair.new('squiggly bracket', '{', '}'),
      BracketPair.new('parenthesis', '(', ')'),
      BracketPair.new('square bracket', '[', ']'),
      BracketPair.new('pipe', '|', '|'),
      BracketPair.new('double quote', '"', '"'),
      BracketPair.new('single quote', "\'", "\'")
    ]
    @pair_index = nil
    @open_bracket = nil
    @close_bracket = nil
  end

  def missing_bracket_pair?(line)
    @open_bracket = nil
    @close_bracket = nil
    line.split(//).each do |char|
      check_pair(char)
    end
    return true if !@open_bracket.nil? && @close_bracket.nil?

    false
  end

  private

  def check_pair(char)
    @bracket_pairs.each_with_index do |i, index|
      if i.open_pair == char && @open_bracket.nil?
        @open_bracket = char
        @pair_index = index
        next
      end
      next unless i.close_pair.eql? char

      @close_bracket = char
    end
  end
end
