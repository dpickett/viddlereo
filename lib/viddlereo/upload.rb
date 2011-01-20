module Viddlereo
  class Upload < Viddlereo::Resource
    auth_required
    resource_name "videos"
    
    element :id, String
    element :endpoint, String
    element :token, String
    
    def self.prepare
      parse(get(:method => :prepare_upload))
    end
  end
end