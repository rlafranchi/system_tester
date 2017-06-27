module TudeTester
  class ClickOn < Action
    def to_s
      "#{super}#{INDENT}click_on \"#{arg_one}\"\n\n"
    end

    def self.friendly_type
      "Click"
    end

    def self.args
      [
        {
          name: 'arg_one',
          label: 'Element',
          type: 'text'
        }
      ]
    end
  end
end
