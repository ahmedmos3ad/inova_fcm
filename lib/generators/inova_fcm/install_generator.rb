require "rails/generators"

module InovaFcm
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def create_initializer_file
        copy_file "inova_fcm_initializer.rb", "config/initializers/inova_fcm.rb"
      end
    end
  end
end
