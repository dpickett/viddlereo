module Viddlereo
  class Playlist < Resource
    auth_required

    resource_name "playlists"

    element :id, String
    element :name, String
    element :type, String
    element :visibility, String
    #has_many :rules, Viddlereo::PlaylistRule
    
    param :users, Array
    param :max_age, Integer
    param :tags, Array
    param :visibility, String
    param :min_views, Integer
    param :max_views, Integer
    param :sort, String

    def save
      new_record = self.class.parse(self.class.post(:method => "create", 
        :name       => self.name, 
        :type       => self.type,
        :visibility => self.visibility
      ))
      self.id = new_record.first.id
      true
    end

    def destroy
      self.class.post(:method => "delete", :playlist_id => self.id)   
      true
    end
  end
end
