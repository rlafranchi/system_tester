module SystemTester
  class Assertion < Step
    def to_s
      "#{INDENT}# Assertion: #{title}\n"
    end

    def self.bg_css
      "green"
    end

    def icon
      "done"
    end
  end
end

%w(assert_text assert_selector).each do |dep|
  require_dependency "system_tester/#{dep}"
end
