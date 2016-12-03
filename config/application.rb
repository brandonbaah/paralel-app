require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ParalelApp
  class Application < Rails::Application

    def name
      if action.recordable_type == "Client"
        client_name = action.recordable.name
      else
        client_name = action.recordable.client.name
      end
    end
    def id
      if action.recordable_type == "Client"
        client_id = action.recordable.id
      else
        client_id = action.recordable.client_id
    end
  end
end


end
