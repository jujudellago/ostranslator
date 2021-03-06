source 'https://rubygems.org'
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Choose between PostgreSQL and MySQL (comment out one of the following gems)
gem 'pg', '~> 0.21.0'
# gem 'mysql2', '~> 0.4.9'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use Puma as the app server
gem 'puma', '~> 4'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0', '>= 5.0.6'
gem 'coffee-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 3.2'
# Turbolinks makes navigating your web application faster. Read more:
# https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1', '>= 3.1.11'
gem 'nokogiri', '1.10.4'
gem 'nio4r', '2.1.0'

#gem "resque", github: "resque/resque", :branch =>'master' , :require => 'resque/server'
#gem "capistrano-resque",  require: false

gem 'whenever', require: false

gem 'websocket-driver', '0.6.5'

gem 'redis-rails'
gem 'bootstrap-sass'
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'


#gem 'lit', :path => "/Users/juju/Dropbox/Brano-Julien-Stuff/custom-gems/lit"
gem 'lit' , :git => 'git://github.com/jujudellago/lit.git'

# List of countries and their respective states and cities
gem 'city-state'
# Authentication
gem 'devise'


gem "figaro"
# Generate fake user names, e-mails, adresses, IPs, lorem text, etc. Include
# in all environments as we might use it to seed the DB in test deploys.

# Use slugs instead of IDs in URLs. Makes prettier URLs, improves SEO and avoids
# leaking DB IDs (for security reasons).
gem 'friendly_id'
# jQuery is no longer installed by default on Rails 5.1
gem 'jquery-rails'
# Pagination
gem 'kaminari'
# Authorization
gem 'pundit'
# Contact form
gem 'mail_form', '1.7.1'
# HTTP caching
gem 'rack-cache'
gem 'bootsnap', require: false
gem 'newrelic_rpm'

gem 'ffi', '1.9.24'

# Locale data for Rails. Rails already comes with i18n capabilities (e.g.,
# translate model attributes, possibility to place all of the app's strings in
# YML dictionaries). Only use this gem if you need to translate Rails to one or
# more non-english languages.
# gem 'rails-i18n', '~> 5.0.0'
# Searching, filtering and sorting
gem 'ransack'
# Advanced select boxes https://select2.github.io/
gem 'select2-rails'
# Get e-mail notifications when exceptions happen in the production environment
gem 'exception_notification'

group :test do
  gem 'database_cleaner'
    gem 'faker'

end

group :development, :test do
  # Detects N+1 queries and unused eager loading
  gem 'bullet'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  # console
  gem 'debug_inspector', '0.0.3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.15', '>= 2.15.1'
  gem 'capybara-email'
  gem 'capybara-screenshot'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'spring-commands-rspec'
  # code coverage analysis tool
  gem 'simplecov', require: false
end

group :development do
  gem 'awesome_print'
  gem 'better_errors'
  # Necessary to use Better Errors' advanced features (REPL, local/instance
  # variable inspection, pretty stack frame names).
  gem 'binding_of_caller'
  # A static analysis security vulnerability scanner for Ruby on Rails apps
  gem 'brakeman', require: false
  # Checks for vulnerable versions of gems
  gem 'bundler-audit'
  # Required by rack-mini-profiler' for call-stack profiling flamegraphs
  gem 'flamegraph'
  # Open "sent" e-mails in your browser instead of actually sending them
#  gem 'letter_opener'
  gem 'listen', '~> 3.1', '>= 3.1.5'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
  # Database, call-stack and memory profiling
  gem 'rack-mini-profiler'
  # Required by rack-mini-profiler for memory profiling
  gem 'memory_profiler'
  gem 'rubocop'
  # Required by rack-mini-profiler for call-stack profiling for Ruby MRI 2.1+
  gem 'stackprof'
  # Access an IRB console on exception pages or by using <%= console %> anywhere
  # in the code.
  gem 'web-console', '~> 3.5', '>= 3.5.1'
  
    gem 'capistrano' ,      require: false
    gem 'capistrano-rails',     require: false
    gem 'capistrano-yarn'
  #  gem 'rvm-capistrano',     require: false
    gem 'capistrano-rbenv'
    gem 'capistrano-bundler', require: false
    #gem 'capistrano3-puma',    require: false
    gem 'capistrano3-puma', github: "seuros/capistrano-puma"
  
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


ruby "2.6.5"
gem 'redis'