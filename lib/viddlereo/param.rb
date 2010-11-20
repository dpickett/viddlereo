module Viddlereo
  class Param
    attr_reader :name
    attr_reader :data_type

    def initialize(name, data_type)
      @name      = name
      @data_type = data_type
    end
  end
end
