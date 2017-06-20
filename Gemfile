source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.1"

gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"

group :development, :test do
  gem "sqlite3"
  gem "byebug",      "3.4.0"
end

group :test do
  gem "minitest-reporters", "1.0.5"
  gem "mini_backtrace",     "0.1.3"
  gem "guard-minitest",     "2.3.1"
end

group :production do
  gem "pg"
  gem "rails_12factor"

end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
