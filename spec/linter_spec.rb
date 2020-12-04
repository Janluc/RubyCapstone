require_relative "../lib/linter.rb"

describe Linter do
  describe "#trailing_whitespace?" do
    it "returns true if there is a whitespace at the end of a line" do
      file = File.open("./to_lint/player.rb")
      linter = Linter.new(file)

      line = "This line has a trailing whitespace "
      expect(linter.trailing_whitespace?(line)).to eql(true)
    end
  end
end