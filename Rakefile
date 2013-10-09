require "bundler/gem_tasks"

desc 'Convert semantic-ui less to sass'
task :convert, :branch do |t, args|
  require './tasks/converter'
  branch = args[:branch]
  Converter.new(branch).process
end