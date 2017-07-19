module SystemTester
  class Action < Step
    def to_s
      "#{INDENT}# Action: #{commented_title}\n"
    end

    def self.bg_css
      "orange"
    end

    def icon
      "input"
    end
  end
end
