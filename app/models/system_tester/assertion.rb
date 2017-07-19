module SystemTester
  class Assertion < Step
    def to_s
      "#{INDENT}# Assertion: #{commented_title}\n"
    end

    def self.bg_css
      "green"
    end

    def icon
      "done"
    end
  end
end
