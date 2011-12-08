require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Partyhat::Forums" do

  before :all do
    @valid_qfc = "13-14-933-63418737"
    @invalid_qfc = "13--14-14-933-63418737"
  end

  it "should validate quick find codes" do
    Partyhat::Forums.valid_qfc?(@valid_qfc).should eq(true)
    Partyhat::Forums.valid_qfc?(@invalid_qfc).should eq(false)
  end

  context "Partyhat::Forums::ForumThread" do
    before :all do
      @thread = Partyhat::Forums::ForumThread.new(@valid_qfc)
    end

    it "should be instantiable with a qfc" do
      @thread.should be_instance_of(Partyhat::Forums::ForumThread)
    end

    it "should have accessible values" do
      @thread.title.should eq('Behind The Scenes - December')
      @thread.posts.size.should > 0
      @thread.qfc.should eq(@valid_qfc)
      @thread.link.should eq(Partyhat::Forums::ForumThread::URL_FORMAT % @valid_qfc.gsub(/-/, ','))
    end
  end

  describe "Partyhat::Forums::ForumPost" do
    before :all do
      @thread = Partyhat::Forums::ForumThread.new(@valid_qfc)
      @posts = @thread.posts
    end

    it "should have the right information" do
      @posts.each do |post|
        post.author.should_not be_nil
        post.posted.should_not be_nil
        post.contents.should_not be_nil
      end
    end
  end
end