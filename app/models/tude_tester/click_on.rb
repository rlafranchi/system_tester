module TudeTester
  class ClickOn < Action
    def to_s
      "#{super}#{INDENT}click_on \"#{arg_one}\"\n\n"
    end

    def friendly_type
      "Click"
    end
  end
end
