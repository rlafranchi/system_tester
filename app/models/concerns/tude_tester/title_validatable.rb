module TudeTester
  module TitleValidatable
    extend ActiveSupport::Concern

    included do
      validates_presence_of :title
      validates_uniqueness_of :title
      validates_format_of :title, with: /\A[a-zA-Z\s]*\z/
    end
  end
end