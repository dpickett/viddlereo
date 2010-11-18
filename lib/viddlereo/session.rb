module Viddlereo
  class Session < Resource
    resource_name 'users'
    tag "auth"

    element :session_id, String, :tag => "sessionid"
    element :record_token, String

    def self.auth(get_token = false)
      parse(get(:method => "auth",
        :user             => Viddlereo.user,
        :password         => Viddlereo.password,
        :get_record_token => get_token ? 1 : 0))
    end
  end
end
