require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ostranslator
  :nodoc
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified
    # here. Application configuration should go into files in
    # config/initializers -- all .rb files in that directory are automatically
    # loaded.

    # Locale config
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:en, :ar, :gl, :bg, :cs, :no, :ro, :sk, :de, :uk, :nl, :ko, :fa, :da, :fi, :fr, :vi, :he, :th, :tl, :el, :tr, :hu, :oc, :id, :uz, :it, :ca, :pl, :'pt-PT', :'pt-BR', :ru, :es, :is, :sv, :ab, :ja, :hr, :'zh-CN', :sr, :ms, :et, :km, :ka, :mk, :sq, :sl, :'zh-TW', :si, :ur, :eu, :bn, :az, :hi, :eo, :br, :at]
    config.i18n.fallbacks =[:en]
    config.i18n.load_path +=
      Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    config.generators do |g|
      # Disable CoffeeScript
      g.javascript_engine :js
      # Configure RSpec and FactoryGirl
      g.test_framework :rspec,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: true,
                       request_specs: true,
                       # Use fixture replacements (factories)
                       fixtures: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end
