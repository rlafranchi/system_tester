module SystemTester
  class Engine < ::Rails::Engine
    isolate_namespace SystemTester
    config.generators.api_only = true

    config.to_prepare do
      Dir.glob(SystemTester::Engine.root.join("app", "models" , "**", "*.rb")).each do |dep|
        require_dependency dep
      end
    end
  end
end
