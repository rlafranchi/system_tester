module TudeTester
  class Action < Step
    def to_s
      "#{INDENT}# Action: #{title}\n"
    end

    def bg_css
      "orange"
    end

    def icon
      "input"
    end
  end
end

%w(click_on fill_in visit).each do |dep|
  require_dependency "tude_tester/#{dep}"
end
