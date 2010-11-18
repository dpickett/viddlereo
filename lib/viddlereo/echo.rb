module Viddlereo
  class Echo < Resource
    resource_name "api"
    tag "echo_response"
    element :message, String

    def self.retrieve(message = "")
      parse(get(:method => "echo", :message => message))
    end
  end
end
