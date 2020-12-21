source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.0.3'
gem 'puma', '~> 4.1'
gem 'mongoid', github: 'mongodb/mongoid', branch: 'master'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'hamlit'
gem 'simple_form'
gem 'rails-i18n'
gem 'devise'
gem 'cocoon'
gem 'cancancan'
gem 'font-awesome-sass', '~> 5.12.0'
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'pry-doc'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'hamlit-rails'
  gem 'letter_opener'
end

group :test do
  gem 'database_cleaner'
  gem 'faker'
  gem 'capybara'
  gem 'mongoid-rspec'
  # request commands test
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  gem 'rails_12factor'
end
