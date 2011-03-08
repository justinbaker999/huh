class Huh
  class Task
    def initialize(name = :test, files = [])
      task name do
        Huh.run(files)
      end
    end
  end
end
