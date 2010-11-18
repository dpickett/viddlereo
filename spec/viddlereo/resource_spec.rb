require 'spec_helper'

describe "a viddlereo resource" do
  #because it's a basic child of Viddlereo::Resource
  subject { Viddlereo::Echo }

  context "the url" do
    it "points to viddler.com" do
      subject.uri.should =~ /viddler\.com/
    end

    it "contains the resource name" do
      subject.uri.should =~ /echo/
    end

    it "optionally contains a method" do
      subject.uri("a_method").should =~ /a_method\.xml/
    end
    
  end

end
