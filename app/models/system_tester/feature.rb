module SystemTester
  class Feature < ApplicationRecord
    include SystemTester::TitleValidatable
    validates_uniqueness_of :title

    has_many :scenarios, foreign_key: "system_tester_feature_id", class_name: 'SystemTester::Scenario', dependent: :destroy

    def to_s
      str = ""
      str << open
      str << scenarios.map(&:to_s).join("")
      str << close
      str
    end

    private

    def open
      str = ""
      str << "require 'application_system_test_case'\n\n"
      str << "module SystemTester\n"
      str << "  class #{stripped_title.camelize}Test < ApplicationSystemTestCase\n"
      str
    end

    def close
      "  end\nend\n"
    end

    def stripped_title
      title.gsub(/\s+/,"")
    end
  end
end
