require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

begin
  require 'rubocop/rake_task'

  desc 'Run style checker'
  RuboCop::RakeTask.new(:rubocop) do |task|
    task.requires << 'rubocop-rspec'
    task.fail_on_error = true
  end
  task spec: :rubocop
rescue LoadError
  $stderr.puts "Unable to load Rubocop"
end

task :configure_test_for_code_coverage do
  ENV['COVERAGE'] = 'true'
end

task :code_coverage do
  require 'json'
  $stdout.puts "Checking code_coverage"
  coverage_percentage = JSON.parse(File.read('coverage/.last_run.json')).fetch('result').fetch('covered_percent').to_i
  goal = 100
  if goal > coverage_percentage
    abort("Code Coverage Goal Not Met:\n\t#{coverage_percentage}%\tExpected\n\t#{goal}%\tActual")
  end
end

task(
  default: [
    'rubocop',
    'configure_test_for_code_coverage',
    'spec',
    'code_coverage'
  ]
)
