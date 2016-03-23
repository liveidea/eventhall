require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'carrierwave/processing/mini_magick'
require "attachinary/orm/active_record"


Bundler.require(*Rails.groups)

module Eventhall
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
  end

end