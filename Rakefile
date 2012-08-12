require 'rubygems'
gem 'test-unit'
require 'test/unit'
require 'rake/testtask'
require "bundler/gem_tasks"

task :default => :test

Rake::TestTask.new do |t|
  t.loader = :direct
  dir = File.dirname(__FILE__)
  t.test_files = FileList["#{dir}/test/**/test*.rb"]
end
