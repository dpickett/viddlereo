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


  let(:name) {"Some Playlist"}
  let(:playlist) do
    playlist = Viddlereo::Playlist.new
    playlist.name = name
    playlist.type = "smart"
    playlist.visibility = "private"
    playlist
  end

  context "creating" do
    use_vcr_cassette :record => :new_episodes 

    subject { playlist }

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

  context "fetching" do
    use_vcr_cassette :record => :new_episodes
    subject { playlist }

    before do
      subject.save.should be_true
    end

    after do
      subject.destroy.should be_true
    end

    it "should return a list of videos" do
      list = Viddlereo::Playlist.find_by_id(subject.id)
      list.videos.should be_kind_of(Array)
    end

    it "should return the intended video" do
      list = Viddlereo::Playlist.find_by_id(subject.id)
      list.name.should eql(subject.name)
    end
  end
  
  context "fetching by user" do
    use_vcr_cassette :record => :new_episodes
    subject { playlist }
    
    before do
      subject.save.should be_true
    end

    after do
      subject.destroy.should be_true
    end
    
    it "returns the playlist for the logged in user" do
      Viddlereo::Playlist.find_by_user(Viddlereo.configuration.user).collect{|i| i.id}.should include(subject.id)
    end
  end
end
