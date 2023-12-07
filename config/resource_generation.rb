module Config
  class ResourceGeneration
    def initialize
      @config = load_config
    end

    def wood_per_level
      config['resource_generation']['wood_per_level']
    end

    def food_per_level
      config['resource_generation']['food_per_level']
    end

    def stone_per_level
      config['resource_generation']['stone_per_level']
    end

    private

    attr_reader :config
    def load_config
      YAML.load_file(File.expand_path('..', __dir__) + '/config/resource_generation.yml')
    end
  end
end