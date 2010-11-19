require 'spec_helper'

describe Viddlereo::Playlist do
  context "parameters" do
    subject { Viddlereo::Playlist.new }
    it "has a users parameter" do
      subject.users.should be_kind_of(Array)
      subject.users.should be_empty
    end

    it "has a max_age parameter" do
      subject.should respond_to(:max_age)
      lambda { subject.max_age = 1 }.should_not raise_error
    end
  end
  context "creating" do
    use_vcr_cassette :record => :new_episodes 

    let(:name) {"Some Playlist"}
    subject do
      playlist = Viddlereo::Playlist.new
      playlist.name = name
      playlist.type = "smart"
      playlist.visibility = "private"
      playlist
    end

    context "successfully" do
      before(:each) do
        subject.save.should be_true
      end

      after(:each) do
        subject.destroy.should be_true
      end

      it "results in having an id" do
        subject.id.should_not be_nil
      end
    end

    context "without a requied field" do

    end
  end
end
