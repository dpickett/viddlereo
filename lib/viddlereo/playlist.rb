module Viddlereo
  class Playlist < Resource
    auth_required

    resource_name "playlists"

    element :id, String
    element :name, String
    element :type, String
    element :visibility, String
    has_many :videos, Viddlereo::Video

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

    def self.find_by_id(playlist_id, options = {})
      begin
        response = get(:method => :getDetails, 
          :playlist_id => playlist_id,
          :per_page => options[:per_page] || 100, 
          :page => options[:page] || 1)
        playlist = parse(response).first
        playlist.videos = Viddlereo::Video.parse(response) if playlist
        playlist
      rescue RestClient::ResourceNotFound
        nil
      end
    end
    
    def self.find_by_user(user, options = {})
      begin
        response = get(:method => :getByUser, 
          :user => user,
          :per_page => options[:per_page] || 100, 
          :page => options[:page] || 1)
        parse(response)
      rescue RestClient::ResourceNotFound
        []
      end
    end
  end
end
