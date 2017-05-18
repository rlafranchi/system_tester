module TudeTester
  class Visit < Action
    def to_s
      "#{super}#{INDENT}visit #{arg_one}\n\n"
    end
  end
end
