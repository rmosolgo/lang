source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '4.0.0'
gem 'pg'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'unicorn'
gem "active_model_serializers"
gem 'batman-rails', '~> 0.15'

gem 'haml', '~> 4.0.0'
gem 'haml_assets'

gem 'wikipedia-client'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks'
gem 'will_paginate'
gem 'simple_form'

gem 'anjlab-bootstrap-rails',
  require: 'bootstrap-rails',
  github: 'anjlab/bootstrap-rails'
gem 'bootstrap-will_paginate',
  github: 'yrgoldteeth/bootstrap-will_paginate'

group :production do
  gem 'rails_12factor', group: :production
end

group :development do
  gem 'guard'
  gem 'spork-rails', :github => 'sporkrb/spork-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'rspec-rails', '~> 2.0'
  gem 'pry-rails'
  gem 'quiet_assets'
end

group :test do
  gem 'rspec-rails', '~> 2.0'
  gem "factory_girl_rails", "~> 4.0"
  gem 'faker'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
