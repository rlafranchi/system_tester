module TudeTester
  class FillIn < Action
    def to_s
      "#{super}#{INDENT}fill_in #{arg_one}, with: \"#{arg_two}\"\n\n"
    end

    def friendly_type
      "Fill In"
    end
  end
end
