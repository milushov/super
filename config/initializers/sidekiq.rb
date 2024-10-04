# frozen_string_literal: true

require 'sidekiq'
require 'sidekiq-unique-jobs'

schedule_file = 'config/schedule.yml'

Sidekiq::Cron::Job.load_from_hash! YAML.load_file(schedule_file) if File.exist?(schedule_file) && Sidekiq.server?

Sidekiq.configure_client do |config|
  config.client_middleware do |chain|
    chain.add SidekiqUniqueJobs::Middleware::Client
  end
end

Sidekiq.configure_server do |config|
  config.client_middleware do |chain|
    chain.add SidekiqUniqueJobs::Middleware::Client
  end

  config.server_middleware do |chain|
    chain.add SidekiqUniqueJobs::Middleware::Server
  end

  config.logger = Sidekiq::Logger.new(STDOUT)
  config.logger.level = Logger::DEBUG
  # config.logger.formatter = Sidekiq::Logger::Formatters::Pretty.new
end
