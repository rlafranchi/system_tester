module TudeTester
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
    establish_connection :tude_tester
  end
end
