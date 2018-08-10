source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.6'

gem 'bootstrap', '4.0.0'
gem 'will_paginate', '~> 3.1', '>= 3.1.6'
gem 'activemerchant', '~> 1.78'
gem 'devise'
gem 'sidekiq', '~> 5.1', '>= 5.1.3'
gem 'puma', '~> 3.7'

gem 'sass-rails', '~> 5.0'

gem 'uglifier', '>= 1.3.0'

gem 'jquery'
gem 'jquery-rails', '~> 4.3.1'
gem 'jquery-ui-rails'

gem 'coffee-rails', '~> 4.2'

gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bcrypt', '~> 3.1.7'
gem 'aws-sdk-s3', '~> 1.9', '>= 1.9.1'
gem 'fog-aws', '~> 2.0'
gem 'aws-sdk', '~> 3.0', '>= 3.0.1'
gem 'mini_magick'
gem 'carrierwave', '~> 0.11.2'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'geocoder', '~> 1.4', '>= 1.4.9'
gem 'globalize', '~> 5.1.0'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'redis', '~> 4.0', '>= 4.0.1'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'foreman'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring

end

group :production do
  gem 'pg', '~> 0.21.0'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
