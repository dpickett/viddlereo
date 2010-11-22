module Viddlereo
  class Video < Resource
    auth_required
    resource_name "videos"
    
    element :id, String
    element :status, String
    element :author, String
    element :title, String
    element :length, Integer
    element :description, String
    element :url, String
    element :thumbnail_url, String
    element :permalink, String
    element :html5_video_source, String
    element :view_count, Integer
    element :upload_time, DateTime
    element :made_public_time, DateTime
    element :favorite, Boolean
    element :comment_count, Integer
    element :embed_code, String
    
    def self.find_by_id(identifier, options = {})
      response = get(:method => :getDetails, 
        :video_id => identifier,
        :add_embed_code => options[:add_embed_code] || 1)
      video = parse(response)
    end
    
    def get_embed_code(options = {})
      response = self.class.get(:method => :getEmbedCode,
        :video_id => self.id,
        :embed_code => options[:embed_code] || 3)
      self.embed_code = self.class.parse(response).embed_code
    end
  end
end
