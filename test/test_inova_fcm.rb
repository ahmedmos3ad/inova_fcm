# frozen_string_literal: true

require "test_helper"
require_relative "../lib/inova_fcm/test_config"

class TestInovaFcm < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::InovaFCM::VERSION
  end

  def setup
    InovaFCM.configuration = InovaFCM::Configuration.new
  end

  # def test_bulk_notification
  #   notification = {title: "Test", body: "Test"}
  #   data = {need_action: true, data: "data", type: "type", data_id: 1}
  #   registration_ids = ["test1", "test2"]
  #   InovaFCM::Service.new(registration_ids: registration_ids, notification: notification, data: data).send_notification
  # end
end
