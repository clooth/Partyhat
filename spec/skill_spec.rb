require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Partyhat::Skill" do
  before :each do
    @skill          = Partyhat::Skill.new(:attack, 1, 0, 50000)
    @better_skill   = Partyhat::Skill.new(:attack, 4, 500, 234)
    @unranked_skill = Partyhat::Skill.new(:dungeoneering, -1, -1, -1)
  end

  it "should be initializable" do
    @skill.should be_instance_of(Partyhat::Skill)
  end

  it "should raise error on invalid skill name" do
    lambda {
      Partyhat::Skill.new(:jingle_bells, 1, 0, 49999)
    }.should raise_error
  end

  it "should have accessible information" do
    @skill.name.should            eq(:attack)
    @skill.human_name.should      eq(Partyhat::Stat.human_name_for(@skill.name))
    @skill.level.should_not       be_nil
    @skill.experience.should_not  be_nil
    @skill.rank.should_not        be_nil
  end

  it "should turn negative and/or 0 values into nils" do
    @unranked_skill.level.should      eq(nil)
    @unranked_skill.experience.should eq(nil)
    @unranked_skill.rank.should       eq(nil)
  end

  context "Comparing" do
    it "should be able to compare two skills" do
      @skill.compare_to(@better_skill).should be_instance_of(Partyhat::SkillComparison)
    end

    it "should not be possible to compare a skill and an activity" do
      lambda {
        @skill.compare_to(Partyhat::Activity.new(:ba_attackers, 5000, 10))
      }.should raise_error
    end

    it "should be comparable to other skills" do
      comparison = @skill.compare_to(@better_skill)
      comparison.level.should       eq(3)      # Level is better when it's higher
      comparison.experience.should  eq(500)    # Experience is higher than the first skill
      comparison.rank.should        eq(-49766) # Rank should be higher (smaller is better)
    end
  end
end