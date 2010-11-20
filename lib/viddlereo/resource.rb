module Viddlereo
  class Resource
    BASE_URI = "http://api.viddler.com/api/v2/"

    def initialize
      self.class.params.each do |p|
        if p.data_type == Array
          self.send("#{p.name}=", [])
        end
      end
    end

    def self.inherited(child)
      child.send(:include, HappyMapper)
    end

    def self.default_options
      defaults = {
        :key => Viddlereo.key
      }

      defaults[:sessionid] = Viddlereo.session_id if Viddlereo.has_session?
      defaults
    end

    def self.client
      RestClient
    end

    def self.auth_required
      @auth_required = true
    end

    def self.auth_required?
      @auth_required
    end

    def self.resource_name(name)
      @resource_name = name
    end

    def self.uri(method_name = nil)
      BASE_URI + "viddler." + (@resource_name || name.downcase.split("::").last) +
        (!method_name.nil? ? ".#{method_name}" : "") + ".xml"
    end

    def self.get(options = {})
      prepare_request
      method_name = options.delete(:method)
      begin
        client.get uri(method_name), :params => options.merge(default_options)
      rescue RestClient::BadRequest => e
        raise Viddlereo::Error.from_rest_client_exception(e)
      end
    end

    def self.post(options = {})
      prepare_request
      method_name = options.delete(:method)
      begin
        response = client.post uri(method_name), options.merge(default_options)
      rescue RestClient::BadRequest => e
        raise Viddlereo::Error.from_rest_client_exception(e)
      end
    end

    def self.param(name, data_type)
      @params ||= []
      @params << Viddlereo::Param.new(name, data_type)
      attr_accessor name
    end

    def self.params
      @params || []
    end

    def params
      @params = {}
      self.class.params.each do |p|
        @params[p.name] = self.send(p.name)
      end

      @params
    end

    protected
    def self.prepare_request
      if auth_required? && !Viddlereo.has_session?
        Viddlereo.retrieve_session
      end
    end
  end
end
