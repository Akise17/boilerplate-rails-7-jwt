source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.1'
gem 'activerecord-postgis-adapter'
gem 'bootsnap', require: false
gem 'devise'
gem 'devise-jwt'
gem 'devise_token_auth'
gem 'figaro'
gem 'importmap-rails'
gem 'pg', '>= 0.18', '< 2.0'
gem 'pg_search'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.0.3'
gem 'ransack'
gem 'ransack-enum'
gem 'redis', '~> 4.0'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', require: false
  gem 'faker'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'byebug'
  gem 'pry'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
