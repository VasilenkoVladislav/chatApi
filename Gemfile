source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'

# Use Puma as the app server
gem 'puma', '~> 3.7'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.7.0'

# Use Redis adapter to run Action Cable in production
gem 'redis', '4.0.1'
gem 'redis-namespace', '1.6.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# API documentation
gem 'apipie-rails', '0.5.6'

# Registration & authorization
gem 'devise_token_auth', '0.1.42'
gem 'devise-i18n', '1.5.1'
gem 'omniauth', '1.8.1'
gem 'omniauth-facebook', '4.0.0'
gem 'omniauth-twitter', '1.4.0'
gem 'omniauth-google-oauth2', '0.5.3'
gem 'cancancan', '2.1.3'

# Amazon web services
gem 'aws-sdk', '3.0.1'

# ElasticSearch
gem 'searchkick', '2.4.0'

#Concurrent
gem 'concurrent-ruby', '1.0.5', require: 'concurrent'