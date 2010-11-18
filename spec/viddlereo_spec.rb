require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Viddlereo" do
  before do
    @old_key_value = Viddlereo.key
    Viddlereo.key = "somekey"
  end

  after do
    Viddlereo.key = @old_key_value
  end

  subject { Viddlereo }
  it "has a key" do
    Viddlereo.key.should_not be_nil
  end

  context "before retrieving a session" do
    it "does not have a session" do
      subject.has_session?.should be_false
    end
  end
end
