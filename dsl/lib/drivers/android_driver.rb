require 'calabash-android'
require 'calabash-android/operations'

module CogBurn
module Drivers

  class AndroidDriver

    attr_accessor :driver
    def initialize config
      ENV['MAIN_ACTIVITY'] = config.android_app.main_activity
      ENV['APP_PATH'] = "app/android/#{config.android_app.app_name}"
      ENV['TEST_APP_PATH'] = "app/android/#{config.android_app.test_app_name}"
      ENV['TEST_SERVER_PORT'] = config.android_app.test_server_port.to_s

      @driver = Calabash::ABase.new config.android_app.calabash_world
    end

  end # class AndroidDriver
end
end # module CogBurn::Drivers