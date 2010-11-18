module Viddlereo
  class Echo < Resource
    resource_name "echo"
    tag "echo_response"
    element :message, String

    def self.retrieve(message = "")
      parse(get(:message => message))
    end
  end
end
