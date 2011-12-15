require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Partyhat::Calculators" do
  it "should calculate combat" do
    maxed = Partyhat::Calculators.combat({
      :attack => Partyhat::Skill.new(:attack, 99, 99, 99),
      :defence => Partyhat::Skill.new(:defence, 99, 99, 99),
      :strength => Partyhat::Skill.new(:strength, 99, 99, 99),
      :constitution => Partyhat::Skill.new(:constitution, 99, 99, 99),
      :ranged => Partyhat::Skill.new(:ranged, 99, 99, 99),
      :prayer => Partyhat::Skill.new(:prayer, 99, 99, 99),
      :magic => Partyhat::Skill.new(:magic, 99, 99, 99),
      :summoning => Partyhat::Skill.new(:summoning, 99, 99, 99)
    })

    maxed[:level].to_i.should eq(138)
  end
end