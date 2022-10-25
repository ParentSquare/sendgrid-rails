require 'send_grid'
require 'active_support'
require 'active_support/core_ext'
require 'action_mailer'

ActiveSupport.on_load(:action_mailer) do
  ActionMailer::Base.send :include, SendGrid
end
