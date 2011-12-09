# Load mail configuration if not in test environment
email_config_file = File.join Rails.root, 'config', 'smtp_settings.yml'
if File.exists?(email_config_file) and !Rails.env.test?
  email_settings = YAML::load(File.new(email_config_file).read)[Rails.env]
  ActionMailer::Base.smtp_settings = email_settings.symbolize_keys unless email_settings.nil?
end
