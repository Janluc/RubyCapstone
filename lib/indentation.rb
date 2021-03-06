class IndentationModule
  attr_accessor :indent_counter
  attr_reader :add_to_counter

  def initialize
    @indent_counter = 0
    @keywords = %w[def class if else]
    @add_to_counter = 0
  end

  def check_indentation(line)
    @add_to_counter = 0
    line_arr = line.split(/ /)
    keywords_in_line(line_arr)
    @indent_counter.negative? ? 0 : @indent_counter

    return true if spaces_in_line(line_arr) != @indent_counter * 2 && line_arr.length > 1 && line_arr[0] != '#'

    @indent_counter += @add_to_counter
    false
  end

  private

  def spaces_in_line(line)
    spaces_inline = 0
    line.each do |word|
      return spaces_inline.zero? ? 0 : spaces_inline unless word == ''

      spaces_inline += 1
    end
  end

  def check_keywords(word)
    ret_val = 0
    @keywords.each do |keyword|
      if word == keyword
        ret_val = 1
        break
      end
    end
    ret_val
  end

  def keywords_in_line(line)
    line.each do |word|
      if check_keywords(word).positive?
        @add_to_counter = check_keywords(word)
        break
      end
      next unless word == 'end'

      @indent_counter /= 2
      @add_to_counter = 0
      break
    end
  end
end
