require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Partyhat::Stat" do
  it "should have lists of stats" do
    [
      Partyhat::Stat::SkillsList,
      Partyhat::Stat::ActivitiesList,
      Partyhat::Stat::CombatSkillsList,
      Partyhat::Stat::List
    ].each do |property|
      property.should_not be_nil
    end
  end

  context "Human names" do
    it "should be able to get names for stats" do
      Partyhat::Stat::List.each do |stat|
        Partyhat::Stat.human_name_for(stat).should_not eq('Undefined')
      end
    end

    it "should gracefully degrade on unknown stat" do
      Partyhat::Stat.human_name_for(:jingle_bells).should eq('Undefined')
    end
  end
end