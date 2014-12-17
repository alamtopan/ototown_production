# -*- encoding : utf-8 -*-

if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source 'https://rubygems.org'

gem 'rails', '4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'autonumeric-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# group :db do
  gem 'pg'
  gem 'therubyracer', :platforms => :ruby
  #gem 'mysql2','0.3.11'
  gem 'ancestry'                        # Table Tree tool
  gem 'inherited_resources'             # DRY for CRUD methods in controller
  gem 'kaminari'                        # pagination
  gem 'protected_attributes'
# end
  gem 'breadcrumbs_on_rails'
  gem "lazyload-rails"

# group :addons do
  gem 'cocoon'                          # Dynamic nested forms using jQuery
  gem 'delayed_job_active_record'       # Background Job Tools
  gem 'daemons'                         # Daemon for Background Job
  gem 'delayed_job_web'                 # Delayed Job Monitoring System
  gem 'acts_as_list'
  gem 'friendly_id'
  gem 'impressionist'
  gem 'httparty'
  gem 'wash_out'
  gem 'htmlentities'
  gem 'activerecord-session_store', github: 'rails/activerecord-session_store'
  gem "exception_notification", :require => "exception_notifier"
#end

group :assets do
  gem 'omniauth'
  gem 'omniauth-facebook'
  gem 'devise'
  gem 'cancan'
  gem 'paperclip'                     # attachment tool
  gem 'mini_magick'
  gem 'ckeditor'
  gem 'acts-as-taggable-on'
end

group :development, :test do
  # gem 'debugger'
  gem 'quiet_assets'
  gem 'letter_opener'
end

group :production, :staging do
  gem 'unicorn'
  gem 'rails_12factor'
  gem 'capistrano', '~> 3.1.0'
  gem 'capistrano-rails', '~> 1.1.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv', "~> 2.0" 
  gem 'capistrano3-unicorn', "~> 0.1.1" 
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'nokogiri', group: [:development, :production]
gem 'rest-client', '~> 1.6.7', group: [:development, :production]



