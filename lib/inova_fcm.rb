# frozen_string_literal: true

require_relative "inova_fcm/version"
require_relative "inova_fcm/configuration"
require_relative "inova_fcm/service"

module InovaFCM
  class Error < StandardError; end
  # Your code goes here...

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
