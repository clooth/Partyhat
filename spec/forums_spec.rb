require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Partyhat::Forums" do

  before :each do
    @valid_qfc = "13-14-933-63418737"
    @invalid_qfc = "13--14-14-933-63418737"
  end

  it "should validate quick find codes" do
    Partyhat::Forums.valid_qfc?(@valid_qfc).should eq(true)
    Partyhat::Forums.valid_qfc?(@invalid_qfc).should eq(false)
  end

  describe "Partyhat::Forums::ForumThread" do
    it "should be instantiable with a qfc" do
      Partyhat::Forums.get_thread_by_qfc(@valid_qfc).should be_instance_of(Partyhat::Forums::ForumThread)
    end
  end

  describe "Partyhat::Forums::ForumPost" do

  end
end