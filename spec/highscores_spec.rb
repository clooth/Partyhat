require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Partyhat::Highscores" do
  it "should fetch highscores properly" do
    stats = Partyhat::Highscores.find_player("Not Clooth")
    Partyhat::Stat::List.each do |stat|
      stats.has_key?(stat).should == true
    end
  end
end