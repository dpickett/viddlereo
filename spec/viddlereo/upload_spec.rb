require 'spec_helper'

describe Viddlereo::Upload do
  context "preparing" do
    use_vcr_cassette :record => :new_episodes
    subject { Viddlereo::Upload.prepare }
    it "returns an upload object with a token" do
      subject.token.should_not be_nil
    end

    it "returns an upload object with an endpoint " do
      subject.endpoint.should_not be_nil
    end
  end
end