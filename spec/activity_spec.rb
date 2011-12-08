require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Partyhat::Activity" do
  before :each do
    @activity          = Partyhat::Activity.new(:ba_attackers, 5000, 10)
    @better_activity   = Partyhat::Activity.new(:ba_attackers, 59834, 2)
    @unranked_activity = Partyhat::Activity.new(:fist_of_guthix, -1, -1)
  end

  it "should be initializable" do
    @activity.should be_instance_of(Partyhat::Activity)
  end

  it "should raise error on invalid skill name" do
    lambda {
      Partyhat::Activity.new(:jingle_bells, 1, 0)
    }.should raise_error
  end

  it "should have accessible information" do
    @activity.name.should             eq(:ba_attackers)
    @activity.human_name.should       eq(Partyhat::Stat.human_name_for(@activity.name))
    @activity.score.should_not        be_nil
    @activity.rank.should_not         be_nil
  end

  it "should turn negative and/or 0 values into nils" do
    @unranked_activity.score.should     eq(nil)
    @unranked_activity.rank.should      eq(nil)
  end

  context "Comparing" do
    it "should be able to compare two activities" do
      @activity.compare_to(@better_activity).should be_instance_of(Partyhat::ActivityComparison)
    end

    it "should not be possible to compare an activity and a skill" do
      lambda {
        @activity.compare_to(Partyhat::Skill.new(:defence, 5000, 10, 2000))
      }.should raise_error
    end

    it "should be comparable to other activities" do
      comparison = @activity.compare_to(@better_activity)
      comparison.score.should       eq(54834)
      comparison.rank.should        eq(-8) # smaller is better
    end
  end
end