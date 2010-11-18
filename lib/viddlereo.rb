require 'configatron'
require 'happymapper'
require 'rest-client'

module Viddlereo
  def self.key=(key)
    configuration.key = key
  end

  def self.key
    configuration.key
  end
  
  def self.user=(user)
    configuration.user = user
  end

  def self.user
    configuration.user
  end

  def self.password=(password)
    configuration.password = password
  end
  
  def self.password
    configuration.password
  end

  def self.retrieve_session
    configuration.session_id = Viddlereo::Session.auth.session_id
  end

  def self.session_id
    configuration.session_id
  end

  def self.has_session?
    !session_id.nil?
  end

  def self.configuration
    configatron.viddlereo
  end
end

require 'viddlereo/resource'
require 'viddlereo/echo'
require 'viddlereo/session'
