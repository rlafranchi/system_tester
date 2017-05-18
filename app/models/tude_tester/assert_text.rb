module TudeTester
  class AssertText < Assertion
    def to_s
      "#{super}#{INDENT}assert_text \"#{arg_one}\"\n\n"
    end
  end
end
