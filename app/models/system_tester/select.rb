module SystemTester
  class Select < Action
    def to_s
      "#{super}#{INDENT}select \"#{arg_one}\", from: \"#{arg_two}\"\n\n"
    end

    def self.friendly_type
      "Select"
    end

    def self.args
      [
        {
          name: 'arg_two',
          label: 'Select Label',
          type: 'text'
        },
        {
          name: 'arg_one',
          label: 'Option',
          type: 'text'
        }
      ]
    end
  end
end