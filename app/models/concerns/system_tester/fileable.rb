require 'fileutils'

module SystemTester
  module Fileable
    extend ActiveSupport::Concern

    included do
      before_save do
        FileUtils.mkdir_p(base_path)
        unless File.exists?(system_test_case_path)
          File.open(system_test_case_path, "w+") { |f| f.write(system_test_case_content) }
        end
      end

      after_touch do
        save_file
      end

      before_create do
        save_file
      end

      before_update do
        if title_changed?
          delete_old_file
        end
        save_file
      end

      before_destroy do
        delete_file
      end

      private

      def test_path
        Rails.root.join("test")
      end

      def base_path
        File.join(test_path, base_dir)
      end

      def full_file
        File.join(base_path, file_name)
      end

      def old_file
        File.join(base_path, file_name_was)
      end

      def delete_file
        File.delete(full_file)
      end

      def delete_old_file
        File.delete(old_file)
      end

      def save_file
        File.open(full_file, 'w+') do |f|
          f.write(code_to_write)
        end
      end

      def system_test_case_path
        File.join(base_path, "system_tester_system_test_case.rb")
      end

      def system_test_case_content
        <<EOF
require "../../test_helper"

module SystemTester
  class SystemTesterSystemTestCase < ActionDispatch::SystemTestCase
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  end
end
EOF
      end
    end
  end
end