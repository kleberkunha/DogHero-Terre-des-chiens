<h1>DogHero / Terre des Chiens</h1>

#Installing

# Languages Ruby on Rails

### Ruby version 2.7.0
### Rails 6.0.6
### Yarn 1.22.19
### Node v12.12.12

### Database: PostgreSQL

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


After installing all the versions of gems you just need to run rails server to start the server in localhost:3000

Registration + email confirmation
Many Users can subscribe to the same event
User can create many dogs
Admin Page that controls Users and Events


This is a application for dogs, where the owner of the dog can find some activities around and have access to the Association, buy food and rent trolley.
