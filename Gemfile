source 'https://rubygems.org'

ruby '2.1.4'

gem 'rails', '~> 4.1.1'

# RAILS 4
gem 'pg'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'

# RACK
gem 'rack-rewrite'

# CONFIGS
gem 'figaro', '~> 0.7.0'

# AUTH / USER CONTROL
gem 'devise', '>= 3.2.2'
gem 'rolify', '>= 3.4.0'
gem 'pundit', '>= 0.2.2'
gem 'aasm'

# CACHING
gem 'dalli'
gem 'kgio'
gem 'iron_cache'

# ASYNC
gem 'sucker_punch', '~> 1.1'

# ASSETS
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '>= 4.0.1'

gem 'nprogress-rails'
gem 'font-awesome-rails'
gem 'bootstrap-sass'
gem 'bootswatch-rails'

# FORMS
# gem 'simple_form', '>= 3.0.1'
gem 'simple_form',
  github: 'plataformatec/simple_form',
  branch: 'master'
gem 'validates_phone_number'
gem 'placeholder-gem'

# VIEWS
gem 'breadcrumbs_on_rails'
gem 'kaminari', '>= 0.15.1'
gem 'bootstrap-kaminari-views',
  git: 'git://github.com/mikechau/bootstrap-kaminari-views.git'
gem 'friendly_id', '~> 5.0.0'

# UTILITIES
gem 'hstore_accessor'
gem 'roo', '>= 1.13.2', require: false
gem 'gibbon', '>= 1.1.1', require: false

# MONITORING
gem 'newrelic_rpm'
gem 'pghero'
gem 'rollbar'

group :production do
  # heroku specific
  gem 'rails_12factor',
    git: 'git://github.com/heroku/rails_12factor.git'

  # LOGGING
  gem 'lograge'

  # SERVER
  gem 'passenger'
end

group :test do
  gem 'database_cleaner'
  gem 'vcr'
  gem 'webmock'

  # Code assessments
  gem 'simplecov', require: nil
  gem 'metric_fu', require: nil
  gem 'coveralls', require: nil
  gem 'codeclimate-test-reporter', require: nil
end

group :test, :development do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'factory_girl_rails', '>= 4.3.0'
  gem 'railroady'

  # Debugger
  gem 'jazz_hands',
    github: 'nixme/jazz_hands',
    branch: 'bring-your-own-debugger'

  gem 'pry-byebug'

  # Sexy autoreload, continuous testing, server reloading
  gem 'spring',
    github: 'guard/spring',
    branch: 'listen2'

  gem 'listen'

  gem 'spring-commands-rspec'
  gem 'libnotify', require: false
  gem 'guard', require: false
  gem 'rack-livereload'
  gem 'guard-livereload', require: false
  gem 'guard-rspec', require: false
end

group :development do
  gem 'annotate', ">= 2.6.0"
  gem 'better_errors', '>= 1.1.0'
  gem 'binding_of_caller', '>= 0.7.2'
  gem 'quiet_assets', '>= 1.0.2'

  # Diagnostics
  gem 'bullet'
  gem 'lol_dba', require: false
  gem 'gem_bench', require: false
end

group :doc do
  gem 'sdoc', require: false
end
