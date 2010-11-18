require 'configatron'

module Viddlereo
  def self.key=(key)
    configuration.key = key
  end

  def self.key
    configuration.key
  end

  def self.retrieve_session

  end

  def self.session
    @session
  end

  def self.has_session?
    !session.nil?
  end

  def self.configuration
    configatron.viddlereo
  end
end
