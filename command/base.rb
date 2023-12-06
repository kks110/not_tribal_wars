module Command
  class Base
    def initialize; end

    def name
      raise NotImplementedError, "Must Implement the name method for command"
    end

    def description
      raise NotImplementedError, "Must Implement the description method for command"
    end

    def execute
      raise NotImplementedError, "Must Implement the execute method for command"
    end

    def options; end
  end
end
