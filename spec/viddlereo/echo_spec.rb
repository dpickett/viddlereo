require 'spec_helper'

describe Viddlereo::Echo do
  context "sending an echo with a message" do
    let(:message) { "HELLO" }

    it "should respond with the message I sent" do
      VCR.use_cassette('echo/message', :record => :new_episodes) do
        @echo = Viddlereo::Echo.retrieve(message)
        @echo.message.should eql(message)
      end
    end
  end
end
