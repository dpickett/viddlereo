module Viddlereo
  class Error < Exception
    include HappyMapper

    tag :error
    element :code, String
    element :description, String

    def self.from_rest_client_exception(rest_client_exception)
      parsed_response = parse(rest_client_exception.response)
      new("Viddlereo Error #{parsed_response.code}: #{parsed_response.description}")
    end
  end
end
