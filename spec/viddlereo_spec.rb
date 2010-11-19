require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Viddlereo" do
  before do
    @old_key_value = Viddlereo.key
    @old_password_value = Viddlereo.password
    Viddlereo.key = "somekey"
    Viddlereo.password = "somepassword"
  end

  after do
    Viddlereo.key = @old_key_value
    Viddlereo.password = @old_password_value
  end

  subject { Viddlereo }
  it "has a key" do
    Viddlereo.key.should_not be_nil
  end
  
  it "has a password" do
    Viddlereo.password.should_not be_nil
  end

  context "before retrieving a session" do
    before do
      @old_session_id = subject.configuration.session_id
      subject.configuration.session_id = nil
    end

    after do
      subject.configuration.session_id = @old_session_id
    end

    it "does not have a session" do
      subject.has_session?.should be_false
    end
  end
end
