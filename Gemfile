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

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# group :db do
  gem 'mysql2','0.3.11'
  gem 'ancestry'                        # Table Tree tool
  gem 'inherited_resources'             # DRY for CRUD methods in controller
  gem 'kaminari'                        # pagination
  gem 'protected_attributes'
# end
  gem 'breadcrumbs_on_rails'

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
#end

group :assets do
  gem 'omniauth-facebook'
  gem 'devise'
  gem 'cancan'
  gem 'paperclip'                     # attachment tool
  gem 'mini_magick'
  gem 'ckeditor'
  gem 'acts-as-taggable-on'
  gem 'nokogiri'
  gem 'rest-client', '~> 1.6.7'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
gem 'debugger', group: [:development, :test]
