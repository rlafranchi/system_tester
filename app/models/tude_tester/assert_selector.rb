module TudeTester
  class AssertSelector < Assertion
    def to_s
      "#{super}#{INDENT}assert_selector \"#{arg_one}\", text: \"#{arg_two}\"\n\n"
    end

    def self.friendly_type
      "Selector"
    end

    def self.args
      [
        {
          name: 'arg_one',
          label: 'Selector',
          type: 'text'
        },
        {
          name: 'arg_two',
          lable: 'Text',
          type: 'text'
        }
      ]
    end
  end
end
