module TudeTester
  class Feature < ApplicationRecord
    has_many :scenarios, foreign_key: "tude_tester_feature_id", class_name: 'TudeTester::Scenario'

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
      str << "module TudeTester\n"
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
