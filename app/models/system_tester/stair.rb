module SystemTester
  class Stair < Step
    include SystemTester::Fileable
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
    alias_method :code_to_write, :module

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

    def stripped_title_was
      title_was.gsub(/\s+/,"")
    end

    def method_name
      stripped_title.underscore
    end

    def method_name_was
      stripped_title_was.underscore
    end

    def base_dir
      File.join("support", "system_tester")
    end

    def file_name
      "#{method_name}.rb"
    end

    def file_name_was
      "#{method_name_was}.rb"
    end
  end
end