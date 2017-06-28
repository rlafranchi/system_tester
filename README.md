# System Tester
A development tool for creating and managing system tests in Ruby on Rails >= 5.1 applications

## Usage
This gem is used only in development and is a mountable rails engine that creates JSON endpoints for a chrome extension.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'system_tester', group: :development
```

Add the system_tester db to `config/database.yml`
```yml
# you may want to consider a shared MySQL/Postgres database
# if you have a team that needs shared access
system_tester:
  <<: *default
  database: db/system_tester.sqlite3
```

And then install and run the migrations:
```bash
$ bundle install
$ RAILS_ENV=system_tester rails db:migrate
```

Mount the engine in config/routes.rb:
```ruby
Rails.application.routes.draw do
  # ... other routes
  
  # Mount in development environment only
  if Rails.env.devolpment?
    mount SystemTester::Engine => "/system_tester"
  end
end
```

Start your dev server and you are good to go.

## Chrome extension
The chrome extension provides a Devtools tab and acts as a client to this gem.

IN DEVELOPMENT - to request access feel free to dm on twitter @ralafranchi.

## Design
System Tester is designed to work with a chrome extension, but could potentially be used for other applications as well.
Run `rails routes` to see what endpoints are provided.  The following design was set in place for the easy of reusing
testing steps:
 
 * Features - the top level: one test script for a feature
 * Scenarios - 1:M assocation from Feature to Scenario. A Scenario is one test method.
 * Steps - Basically a line of code that can be an action or an assertion. STI is used to provide different step types.
 * ScenarioSteps - M:M assocation for Steps and Scenarios which also as a position attribute to allow for reordering.
 * Stairs - TODO - an ordered group of steps that can be reused.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## TODOS
 * File management and hooks to create the scripts. To get the code for a feature you can call `to_s` on it.