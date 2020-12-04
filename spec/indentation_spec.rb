require_relative "../lib/indentation.rb"

describe IndentationModule do
    let(:indentation) {IndentationModule.new}
    describe "#check_indentation" do
        it "returns true if line is missing an indentation" do
            line = "Checking for indentation"
            indentation.indent_counter = 1
            expect(indentation.check_indentation(line)).to eql(true)
        end

        it "returns true if line has too many indentations" do
            line = "    Checking for indentation"
            indentation.indent_counter = 1
            expect(indentation.check_indentation(line)).to eql(true)
        end

        it "returns false if line has correct indentation" do
            line = "  Checking for indentation"
            indentation.indent_counter = 1
            expect(indentation.check_indentation(line)).to eql(false)
        end
    end

    describe "#indent_counter" do
        it "return 1 if word matches list of keywords" do
            word = "def"
            expect(indentation.send(:indent_counter, word)).to eql(1)
        end

        it "returns 0 if word does not match list of keywords" do
            word = "hello"
            expect(indentation.send(:indent_counter, word)).to eql(0)
        end
    end

    describe "#spaces_in_line" do
        it "return the number of spaces in the beginning line" do
            line = "  number of spaces"
            line_arr = line.split(/ /)
            expect(indentation.send(:spaces_in_line, line_arr)).to eql(2)
        end
    end

    describe "#keywords_in_line" do
        it "add number of keywords in line to class instance variable" do
            line = "def function_name"
            line_arr = line.split(/ /)
            indentation.send(:keywords_in_line, line_arr)
            expect(indentation.add_to_counter).to eql(1)
        end
    end
end
