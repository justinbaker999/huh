# Huh is a small unit testing library
# It supports many assertions commonly used, and has no external dependencies.
#
# Author:: Justin Baker (mailto:bakermoto@gmail.com)       
# Copyright:: Copyright (c) 2010 Justin Baker
# License::   MIT license

# This class creates a task in a Rakefile to run tests from rake
#
  class Task
    def initialize(name = :test, files = [])
      task name do
        Huh.run(files)
      end
    end
  end
end
