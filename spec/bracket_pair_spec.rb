require_relative '../lib/bracket_pair'

describe BracketPairModule do
  let(:bracket) { BracketPairModule.new }
  describe "#missing_bracket_pair" do
    it "return true if line is missing a closing bracket" do
      line = "(this line is missing a parenthesis"
      expect(bracket.missing_bracket_pair?(line)).to eql(true)
    end

    it "return false if line is not missing a closing bracket" do
      line = "(this line is not missing a parenthesis)"
      expect(bracket.missing_bracket_pair?(line)).to eql(false)
    end
  end

  describe "#check_pair" do
    it "assigns bracket pair value to class instance variables" do
      line = "(this line is not missing a parenthesis)"
      line.split(//).each do |char|
        bracket.send(:check_pair, char)
      end
      expect(bracket.open_bracket).to eql('(')
      expect(bracket.close_bracket).to eql(')')
    end
  end
end