module InovaFCM
  class Configuration
    attr_accessor :fcm_key, :firebase_admin_sdk_path, :firebase_project_id

    def validate!
      required_attributes = [:fcm_key, :firebase_admin_sdk_path, :firebase_project_id]

      required_attributes.each do |attribute|
        value = send(attribute)
        raise ArgumentError, "#{attribute} is required in the configuration" if value.nil? || (value.respond_to?(:empty?) && value.empty?)
      end
    end
  end
end
