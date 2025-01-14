# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VotingSystem
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.time_zone = 'Asia/Karachi'
    config.active_job.queue_adapter = :sidekiq
    config.secret_key_base = '<%= ENV["SECRET_KEY_BASE"] %>'
    config.load_defaults 5.2
    config.before_configuration do
      env_file = Rails.root.join('config/local_env.yml')
      if File.exist?(env_file)
        YAML.safe_load(File.open(env_file)).each do |key, value|
          ENV[key.to_s] = value
        end
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
