require File.dirname(__FILE__) + "/lib/huh"

task :default do
  sh "gem build huh.gemspec"
end

task :push do
  sh "gem push huh-#{Huh::V}.gem"
end
