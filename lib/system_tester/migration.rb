module SystemTester
  class Migration
    include ActiveRecord::Tasks

    def self.run
      DatabaseTasks.database_configuration = YAML.load_file(Rails.root.join("config", "system_tester.yml"))
      puts DatabaseTasks.database_configuration
      Fileutils.mkdir_p(Rails.root.join("db", "system_tester"))
      DatabaseTasks.db_dir = Rails.root.join("db", "system_tester")
      DatabaseTasks.env = "system_tester"
      DatabaseTasks.migrations_paths = [SystemTester::Engine.root.join("db", "migrate")]
      DatabaseTasks.root = Rails.root

      # Tables
      # SystemTester::ApplicationRecord.connection.tables
      # if SystemTester::ApplicationRecord.connection.table_exists? 'system_tester_features'
      #   puts "DB Exists!"
      # else
      #   puts "Creating db"
      # end
      DatabaseTasks.create_current("system_tester")

      # DatabaseTasks.migrate
    end
  end
end