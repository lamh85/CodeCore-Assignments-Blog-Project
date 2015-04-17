ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: "587",
  enable_starttls_auto: true,
  authentication: :plain,
  # The variables below are defined in /config/initializers/app_keys.rb
  user_name: ENV["GMAIL_USERNAME"],
  password: ENV["GMAIL_PASSWORD"]
}