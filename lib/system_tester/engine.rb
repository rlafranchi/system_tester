module SystemTester
  class Engine < ::Rails::Engine
    isolate_namespace SystemTester
    config.generators.api_only = true

    initializer :override_db_dir do |app|
      if Rails.env.system_tester?
        app.config.paths["db"] = config.paths['db'].expanded
      end
    end

    config.to_prepare do
      Dir.glob(SystemTester::Engine.root.join("app", "models" , "**", "*.rb")).each do |dep|
        require_dependency dep
      end
    end
  end
end
