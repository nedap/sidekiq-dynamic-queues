#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'gemfury/tasks'
require 'jeweler'

Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "sidekiq-pro-dynamic-queues"
  gem.homepage = "https://github.com/nedap/sidekiq-dynamic-queues"
  gem.summary = "A sidekiq (pro) plugin for specifying the queues a worker pulls from with wildcards, negations, or dynamic look up from redis"
  gem.email = "matt@conwaysplace.com"
  gem.authors = ["Matt Conway"]
  gem.version = "0.6.0"
  # dependencies defined in Gemfile
end

Gemfury.account = "nedap-healthcare"
task :release => 'fury:release'