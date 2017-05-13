module TudeTester
  class Engine < ::Rails::Engine
    isolate_namespace TudeTester
    config.generators.api_only = true
  end
end
