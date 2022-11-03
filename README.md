<h1>DogHero / Terre des Chiens</h1>


![TDCDH](https://user-images.githubusercontent.com/29848785/199745786-1c201228-1fdf-47b1-9ffe-a6981f7c4453.png)

![connect](https://user-images.githubusercontent.com/29848785/199745804-f112c900-d5c6-4a7a-9315-157bdb2efa89.png)

![profile](https://user-images.githubusercontent.com/29848785/199745824-11957844-0f99-47ed-9580-feb9f0ed3b01.png)

![DIagramDB](https://user-images.githubusercontent.com/29848785/199758941-e158e5e6-19aa-48e6-9da2-92e6c9225409.png)

#Installing

# Languages Ruby on Rails

### Ruby version 2.7.0
### Rails 6.0.6
### Yarn 1.22.19
### Node v12.12.12

### Database: PostgreSQL

### Host: Heroku

Outside Gems:

gem 'bootstrap-sass'
#### Sass compiler for compiling Sass source files into CSS files
gem 'cancancan'
#### CanCanCan is an authorization library for Ruby and Ruby on Rails which restricts what resources a given user is allowed to access.
gem 'devise'
#### Devise is a flexible authentication solution for Rails based on Warden
gem 'dotenv'
#### Dotenv is a Ruby Gem that loads variables from a .env file into ENV when the environment is bootstrapped
gem 'jquery-rails', '~> 4.3', '>= 4.3.5'
gem 'sendgrid-ruby'
#### This gem allows simple integration between ActionMailer and SendGrid
gem 'sprockets-rails'
#### Sprockets is a Ruby library for compiling and serving web assets
gem 'ransack'
#### Ransack will help you easily add searching to your Rails application
__________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
# Complete Gemfile

### Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
### Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
### Use Puma as the app server
gem 'puma', '~> 4.1'
### Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
### Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 6.0.0.rc.6'
### Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
### Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
### Use Redis adapter to run Action Cable in production
### gem 'redis', '~> 4.0'
### Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

### Use Active Storage variant
### gem 'image_processing', '~> 1.2'

### Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  ### Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  ### Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  ### Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  ### Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  ### Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

### Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]


After installing all the versions of gems you just need to run rails server to start the server in localhost:3000

## Registration + email confirmation
## Many Users can subscribe to the same event
## User can create many dogs
## Admin Page that controls Users and Events --> The admin page is created but not accessible for the moment.


##### This is a application for dogs, where the owner of the dog can find some activities around and have access to the Association, buy food and rent trolley.
