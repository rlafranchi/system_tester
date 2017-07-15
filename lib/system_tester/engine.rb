module SystemTester
  class Engine < ::Rails::Engine
    isolate_namespace SystemTester
    config.generators.api_only = true

    initializer :cors do |app|
      app.config.middleware.insert_before 0, Rack::Cors do
        allow do
          origins 'ebpjncfolmfiiphibdajgblbchkklbcf', 'http://localhost:8080'
          resource '/system_tester/*',
                   :headers => :any,
                   :methods => [:get, :post, :delete, :put, :patch, :options, :head]
        end
      end

      app.config.action_cable.allowed_request_origins = ['chrome-extension://ebpjncfolmfiiphibdajgblbchkklbcf']
    end

    config.to_prepare do
      if Rails.env.development?
        Dir.glob(SystemTester::Engine.root.join("app", "models" , "**", "*.rb")).each do |dep|
          require_dependency dep
        end
      end
    end
  end
end
