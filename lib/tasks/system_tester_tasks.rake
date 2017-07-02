# desc "Explaining what the task does"
# create install task
# TODO:
#   - potentially load using sql instead of migrations
#   - auto mount in the routes
#   - auto add to database.yml defaulting to sqlite3

# remove migration copy in favor of custom migration task
Rake::Task["system_tester:install:migrations"].clear
namespace :system_tester do
  namespace :install do
    desc "(Not Supported)"
    task "migrations" do
      # do nothing
      puts "Not supported..."
    end
  end

  # see ActiveRecord::Tasks::DatabaseTasks
  desc "Running migrations for the System Tester db"
  task :migrate => :environment do
    include ActiveRecord::Tasks
    ENV['RAILS_ENV'] = "system_tester"
    DatabaseTasks.db_dir = Rails.root.join("db")
    DatabaseTasks.env = "system_tester"
    DatabaseTasks.migrations_paths = [SystemTester::Engine.root.join("db", "migrate")]
    DatabaseTasks.root = Rails.root
    DatabaseTasks.create_current("system_tester")
    DatabaseTasks.migrate
  end
end