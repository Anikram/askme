source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'

gem 'rails_12factor'

gem 'rubocop'

gem 'sprockets', '~> 3.7.2'

gem 'uglifier'
# Use Puma as the app server
gem 'puma', '~> 3.7'

gem 'jquery-rails'
# Use SCSS for stylesheets
gem 'recaptcha', require: 'recaptcha/rails'

gem 'invisible_captcha'

gem 'i18n'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
