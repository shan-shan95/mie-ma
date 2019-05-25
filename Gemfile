# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem "aws-sdk-s3"
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise', '>= 4.6.0'
gem 'dotenv-rails'
gem 'gon'
gem 'haml-rails'
gem 'mini_magick'
gem 'mysql2'
gem 'puma', '~> 3.11'
gem 'rack-proxy'
gem 'rails', '~> 5.2.2'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :production do
  gem 'asset_sync'
  gem 'fog-aws'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'foreman'
  gem 'letter_opener'
  gem 'letter_opener_web'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-rails'
  gem 'rufo'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
