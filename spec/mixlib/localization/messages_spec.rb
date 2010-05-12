require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')

describe Mixlib::Localization::Messages do
  describe "when get_message is called" do
    it "should return an array of two strings when the given parameters are valid" do
      message = Messages.get_message("opscode-chef-webui-nodes-show-403", "en_us")
      message.size.should == 2
      message.class.should == Array
      message.each {|m| m.class.should == String}
    end
    
    it "should throw Mixlib::Localization::MessageRetrievalError when the message_key parameter is invalid" do
      lambda { Messages.get_message("nonexistentkey", "en_us") }.should raise_error(Mixlib::Localization::MessageRetrievalError)
    end
    
    it "should use US English as the language when message_key is correct but the language code parameter is invalid" do
      message = Messages.get_message("opscode-chef-webui-nodes-show-403", "nonexistent_language")
      message.size.should == 2
      message.class.should == Array
      message[1].should_not == nil
      message[1].length.should > 0
    end
  end
end
