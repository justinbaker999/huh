require File.dirname(__FILE__) + "/lib/huh"

task :default do
  sh "gem build huh.gemspec"
end

task :push do
  sh "gem push huh-#{Huh::V}.gem"
end

task :clean do
  sh "rm huh-*.gem"
end

task :doc do
  sh "rdoc lib/huh_expanded.rb"
end
