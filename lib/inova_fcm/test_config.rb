# test_config.rb

module InovaFCM
  class Configuration
    require "dotenv"
    Dotenv.load(".env")
    # attr_accessor :fcm_key, :firebase_admin_sdk_path, :firebase_project_id

    def initialize
      @fcm_key = ENV["FCM_KEY"]
      @firebase_admin_sdk_path = ENV["FIREBASE_ADMIN_SDK_PATH"]
      @firebase_project_id = ENV["FIREBASE_PROJECT_ID"]
    end
  end
end
