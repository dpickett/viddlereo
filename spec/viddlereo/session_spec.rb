require 'spec_helper'

describe Viddlereo::Session do
  subject { Viddlereo::Session }
  context "authorization" do
    it "should return a session key" do
      VCR.use_cassette('session/get_key', :record => :new_episodes) do
        session = subject.auth
        session.session_id.should_not be_nil
      end
    end
  end
end
