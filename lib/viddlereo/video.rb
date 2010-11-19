module Viddlereo
  class Video < Resource
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
  end
end
