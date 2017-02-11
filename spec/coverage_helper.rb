## Generation Notes:
##   This file was generated via the commitment:install generator. You are free
##   and expected to change this file.
if ENV['COV'] || ENV['COVERAGE'] || ENV['TRAVIS']
  require "codeclimate-test-reporter" if ENV['TRAVIS']
  require 'simplecov'
  SimpleCov.start
end
