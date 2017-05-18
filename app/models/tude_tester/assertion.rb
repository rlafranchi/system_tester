module TudeTester
  class Assertion < Step
    def to_s
      "#{INDENT}# Assertion: #{title}\n"
    end
  end
end

%w(assert_text assert_selector).each do |dep|
  require_dependency "tude_tester/#{dep}"
end
