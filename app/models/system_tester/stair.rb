module SystemTester
  class Stair < Step
    has_many :stair_steps,
             -> { order 'position asc' },
             class_name: "SystemTester::StairStep",
             foreign_key: "system_tester_stair_id",
             dependent: :destroy
    has_many :steps, -> { order 'position asc' }, through: :stair_steps

    def to_s
      "#{INDENT}# Stair: #{title}\n#{INDENT}#{method_name}\n\n"
    end

    def module
      str = ""
      str << open
      str << steps.map(&:to_s).join("")
      str << close
      str
    end

    def module_name
      stripped_title.camelize
    end

    def icon
      "clear_all"
    end

    def self.bg_css
      "deep-purple"
    end

    private

    def open
      str = ""
      str << "module SystemTester\n"
      str << "  module #{module_name}\n"
      str << "    def #{method_name}\n"
      str
    end

    def close
      "    end\n  end\nend\n"
    end

    def stripped_title
      title.gsub(/\s+/,"")
    end

    def method_name
      stripped_title.underscore
    end
  end
end