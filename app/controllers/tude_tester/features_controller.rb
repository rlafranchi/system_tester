require_dependency "tude_tester/application_controller"

module TudeTester
  class FeaturesController < ApplicationController
    def index
      render json: Feature.all
    end
  end
end
