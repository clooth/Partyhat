require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Partyhat::Player" do
  before :each do
    @player = Partyhat::Player.new("Not Clooth")
  end

  it "should should be instantiable with name" do
    @player.should be_instance_of(Partyhat::Player)
    @player.name.should eq("Not Clooth")
  end

  it "should have stats accessible" do
    Partyhat::Stat::List.each do |stat|
      @player.stats.has_key?(stat).should == true
    end
  end

  it "should calculate combat correctly" do
    @player.combat[:level].to_i.should == 109
  end
end