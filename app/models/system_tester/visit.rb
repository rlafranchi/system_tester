module SystemTester
  class Visit < Action
    @@engines = {}

    def to_s
      "#{super}#{INDENT}visit \"#{arg_one}\"\n\n"
    end

    def self.args
      [
        {
          name: "arg_one",
          label: "Path or Url",
          type: "autocomplete",
          options: collect_routes(Rails.application.routes.routes)
        }
      ]
    end

    private

    # Snatched from action_dispatch/routing/inspector
    def self.collect_routes(routes)
      routes.collect do |route|
        ActionDispatch::Routing::RouteWrapper.new(route)
      end.reject do |route|
        route.internal? || route.reqs.starts_with?("system_tester", "SystemTester") || route.verb != "GET"
      end.collect do |route|
        collect_engine_routes(route)
        {
          name: "#{route.name}_path",
          value: route.path
        }
      end.concat(@@engines.values)
    end

    def self.collect_engine_routes(route)
      name = route.endpoint
      return unless route.engine?
      return if @@engines[name]

      routes = route.rack_app.routes
      if routes.is_a?(ActionDispatch::Routing::RouteSet)
        @@engines[name] = collect_routes(routes.routes)
      end
    end
  end
end
