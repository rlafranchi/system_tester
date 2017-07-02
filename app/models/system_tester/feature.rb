module SystemTester
  class Feature < ApplicationRecord
    include SystemTester::TitleValidatable
    include SystemTester::Fileable
    validates_uniqueness_of :title

    has_many :scenarios, foreign_key: "system_tester_feature_id", class_name: 'SystemTester::Scenario', dependent: :destroy

    def to_s
      str = ""
      str << open
      str << scenarios.map(&:to_s).join("")
      str << close
      str
    end
    alias_method :code_to_write, :to_s

    private

    def open
      str = ""
      str << "require 'system_tester_system_test_case'\n\n"
      str << "module SystemTester\n"
      str << "  class #{stripped_title.camelize}Test < SystemTesterSystemTestCase\n"
      stairs.each do |stair|
        str << "    include #{stair.module_name}\n"
      end
      str << "\n" unless stairs.empty?
      str
    end

    def close
      "  end\nend\n"
    end

    def stripped_title
      title.gsub(/\s+/,"")
    end

    def stripped_title_was
      title_was.gsub(/\s+/,"")
    end

    def stairs
      Stair.joins(:scenarios).where("system_tester_scenarios.system_tester_feature_id = ?", id)
    end

    def base_dir
      File.join("system", "system_tester")
    end

    def file_name
      "#{stripped_title.underscore}.rb"
    end

    def file_name_was
      "#{stripped_title_was.underscore}.rb"
    end
  end
end
