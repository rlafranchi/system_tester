module TudeTester
  class FillIn < Action
    def to_s
      "#{super}#{INDENT}fill_in \"#{arg_one}\", with: \"#{arg_two}\"\n\n"
    end

    def self.friendly_type
      "Fill"
    end

    def self.args
      [
        {
          name: 'arg_one',
          label: 'Input Label',
          type: 'text'
        },
        {
          name: 'arg_two',
          label: 'Text',
          type: 'text'
        }
      ]
    end
  end
end
