# frozen_string_literal: true

require 'sendgrid-rails'

ActionMailer::Base.register_interceptor(SendGrid::MailInterceptor)
ActionMailer::Base.delivery_method = :test
ActionMailer::Base.prepend_view_path File.join(File.dirname(__FILE__), "fixtures", "views")

Dir["#{File.dirname(__FILE__)}/fixtures/mailers/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :should
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.warnings = false
end
