module SystemTester
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
    establish_connection :system_tester
  end
end
