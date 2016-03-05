require File.expand_path('../boot', __FILE__)

require 'rails/all'
# require 'carrierwave/orm/activerecord'
require 'carrierwave/processing/mini_magick'
require "attachinary/orm/active_record"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Eventhall
  class Application < Rails::Application

    config.active_record.raise_in_transactional_callbacks = true
  end

end