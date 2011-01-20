require 'spec_helper'

describe Viddlereo::Video do
  use_vcr_cassette :record => :new_episodes
  context "preparing an upload" do
    it "returns an upload object" do
      Viddlereo::Video.prepare_upload.should be_kind_of Viddlereo::Upload
    end
  end
end
