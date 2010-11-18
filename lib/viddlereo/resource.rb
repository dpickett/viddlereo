module Viddlereo
  class Resource
    BASE_URI = "http://api.viddler.com/api/v2/"

    def self.inherited(child)
      child.send(:include, HappyMapper)
    end

    def self.default_options
      {
        :key => Viddlereo.key
      }
    end

    def self.client
      RestClient
    end

    def self.resource_name(name)
      @resource_name = name
    end

    def self.uri(method_name = nil)
      BASE_URI + "viddler.api." + (@resource_name || name.downcase.split("::").last) +
        (!method_name.nil? ? ".#{method_name}" : "") + ".xml"
    end

    def self.get(options = {})
      method_name = options.delete(:method)
      client.get uri(method_name), :params => options.merge(default_options)
    end
  end
end
