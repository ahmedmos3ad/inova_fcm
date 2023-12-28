module InovaFCM
  class Service
    require "fcm"
    require "json"

    MAX_TOPIC_REGISTRATION_BATCH_SIZE = 1000

    attr_reader :registration_ids, :notification, :data, :topic

    def initialize(registration_ids: [], notification: {}, data: {}, topic: SecureRandom.uuid + Time.now.to_i.to_s)
      @topic = topic
      @registration_ids = registration_ids.uniq
      @notification = notification
      @data = data

      InovaFCM.configuration.validate!

      @fcm = FCM.new(InovaFCM.configuration.fcm_key,
        InovaFCM.configuration.firebase_admin_sdk_path,
        InovaFCM.configuration.firebase_project_id)

      validate_attributes!
    end

    def send_notification
      if @registration_ids.count > 1
        bulk_send_notification
      else
        @fcm.send_v1(prepare_token_message)
      end
    end

    private

    def bulk_send_notification
      register_tokens_to_topic
      @fcm.send_v1(prepare_topic_message)
      unregister_tokens_from_topic
    end

    def prepare_topic_message
      prepare_message.merge(topic: @topic)
    end

    def prepare_token_message
      prepare_message.merge(token: @registration_ids.first)
    end

    def prepare_message
      {
        data: {
          payload: data.to_json,
          click_action: "FLUTTER_NOTIFICATION_CLICK"
        },
        notification: {
          title: @notification[:title],
          body: @notification[:body]
        }
      }
    end

    def register_tokens_to_topic
      @registration_ids.each_slice(MAX_TOPIC_REGISTRATION_BATCH_SIZE) do |registration_ids_batch|
        @fcm.batch_topic_subscription(@topic, registration_ids_batch)
      end
    end

    def unregister_tokens_from_topic
      @registration_ids.each_slice(MAX_TOPIC_REGISTRATION_BATCH_SIZE) do |registration_ids_batch|
        @fcm.batch_topic_unsubscription(@topic, registration_ids_batch)
      end
    end

    def validate_attributes!
      required_attributes = [:registration_ids, :notification, :data]

      required_attributes.each do |attribute|
        value = send(attribute)
        raise ArgumentError, "#{attribute} is required" if value.nil? || (value.respond_to?(:empty?) && value.empty?)
      end
    end
  end
end
