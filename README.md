# InovaFCM

InovaFCM is a Ruby gem designed to simplify interactions with Firebase Cloud Messaging (FCM) for Ruby applications, particularly those built with Ruby on Rails, This gem heavily depends on [fcm](https://github.com/decision-labs/fcm)

## Installation

To use this gem in your project, add it to your application's Gemfile:

```ruby
gem 'inova_fcm', '~> 0.2.0'
```

Alternatively, you can install the gem directly using:

```bash
gem install inova_fcm -v '~> 0.2.0'
```

## Requirments

- Ruby >= 3.1.2
- Rails >= 6.1

## Usage

```bash
rails generate inova_fcm:install
```

This will create a configuration file at config/initializers/inova_fcm.rb. Open the file and set your Firebase credentials:

```ruby
InovaFCM.configure do |config|
  # Set your configuration options here
  config.fcm_key = "AAAA..."
  config.firebase_admin_sdk_path = "path/to/service_account.json"
  config.firebase_project_id = "your_firebase_project_id"
end
```

Replace the placeholder values with your actual Firebase credentials.

To send a notification to a device, you can use the following method:

```ruby
InovaFCM::Service.new(registration_ids: ["registration_id"],
  notification: {title: "tite", body: "body"},
  data: {id: 1}).send_notification
```

Where registration_ids is an array of device registration ids, notification is a hash containing the notification's title and body, and data is a hash of data to be sent with the notification.

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/ahmedmos3ad/inova_fcm/pulls>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ahmedmos3ad/inova_fcm/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the InovaFCM project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ahmedmos3ad/inova_fcm/blob/master/CODE_OF_CONDUCT.md).
