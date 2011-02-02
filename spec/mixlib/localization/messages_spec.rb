require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')

describe Mixlib::Localization::Messages do
  describe "get_message" do
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

  describe "find_message" do
    it "should return an array of two strings when the given parameters are valid" do
      message = Messages.find_message("opscode-chef-webui-nodes-show-403", "en_us")
      message.size.should == 2
      message.class.should == Array
      message.each {|m| m.class.should == String}
    end

    it "should return nil when the message does not exist" do
      message = Messages.find_message("opscode-chef-this-message-does-not-exist", "en_us")
      message.should == nil
    end

    it "should default to returning the 'en_us' locale" do
      message_en = Messages.find_message("opscode-chef-webui-nodes-show-403", "en_us")
      message_default = Messages.find_message("opscode-chef-webui-nodes-show-403")
      message_default.should == message_en
    end

    it "should use 'en_us' if the specified language key does not exits" do
      message_en = Messages.find_message("opscode-chef-webui-nodes-show-403", "en_us")
      message_pig_latin = Messages.find_message("opscode-chef-webui-nodes-show-403", "pig_latin")
      message_pig_latin.should == message_en
    end
  end

  describe "get_message_by_id" do
    it "should return an array of two strings when the given parameters are valid" do
      message = Messages.get_message_by_id("23016", "en_us")
      message.size.should == 2
      message.class.should == Array
      message.each {|m| m.class.should == String}
    end

    it "should throw Mixlib::Localization::MessageRetrievalError when the message_id parameter is invalid" do
      lambda { Messages.get_message_by_id("-2", "en_us") }.should raise_error(Mixlib::Localization::MessageRetrievalError)
    end

    it "should use 'en_us' if the specified language key does not exits" do
      message_en = Messages.get_message_by_id("23016", "en_us")
      message_pig_latin = Messages.get_message_by_id("23016", "pig_latin")
      message_pig_latin.should == message_en
    end

    it "should default to returning the 'en_us' locale" do
      message_en = Messages.get_message_by_id("23016", "en_us")
      message_default = Messages.get_message_by_id("23016")
      message_default.should == message_en
    end
  end

  describe "find_message_by_id" do
    it "should return an array of two strings when the given parameters are valid" do
      message = Messages.find_message_by_id("23016", "en_us")
      message.size.should == 2
      message.class.should == Array
      message.each {|m| m.class.should == String}
    end

    it "should return nil when the message_id does not exist" do
      Messages.find_message_by_id("-1", "en_us").should == nil
    end

    it "should use 'en_us' if the specified language key does not exits" do
      message_en = Messages.find_message_by_id("23016", "en_us")
      message_pig_latin = Messages.find_message_by_id("23016", "pig_latin")
      message_pig_latin.should == message_en
    end

    it "should default to returning the 'en_us' locale" do
      message_en = Messages.find_message_by_id("23016", "en_us")
      message_default = Messages.find_message_by_id("23016")
      message_default.should == message_en
    end
  end

  describe "MESSAGES_BY_KEY" do
    it "should have one message per key" do
      seen_keys = {}
      Messages::MESSAGES_BY_KEY.each do |k, v|
        seen_keys[k].should == nil
        seen_keys[k] = v
      end
    end

    it "should have one message per id" do
      seen_ids = {}
      Messages::MESSAGES_BY_KEY.each do |k, v|
        seen_ids[v['message_id']].should == nil
        seen_ids[v['message_id']] = v.merge({'message_key' => k})
      end
    end
  end
end
