module TudeTester
  class AssertText < Assertion
    def to_s
      "#{super}#{INDENT}assert_text \"#{arg_one}\"\n\n"
    end

    def self.friendly_type
      "Text"
    end

    def self.args
      [
        {
          name: 'arg_one',
          label: 'Text',
          type: 'text'
        }
      ]
    end
  end
end
