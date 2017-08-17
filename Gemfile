source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.1"
gem "bcrypt", "3.1.11"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "jquery-rails", "4.1.1"
gem "bootstrap-sass", "3.3.6"
gem "config"
gem "private_pub"
gem "thin"
gem 'faye'
gem 'rails_emoji_picker'
gem "carrierwave", "1.1.0"
gem "mini_magick", "4.7.0"
gem "fog", "1.40.0"
gem "will_paginate", "3.1.0"
gem "bootstrap-will_paginate", "0.0.10"
group :development, :test do
  gem "sqlite3"
  gem "byebug",      "3.4.0"
end

group :test do
  gem "minitest-reporters", "1.0.5"
  gem "mini_backtrace", "0.1.3"
  gem "guard-minitest", "2.3.1"
end

group :production do
  gem "pg"
  gem "rails_12factor"

end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
