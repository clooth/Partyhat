require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Partyhat::Util" do
  before :each do
    @sliding_experiences = {
      2   => 150,
      34  => 21_000,
      60  => 280_000,
      83  => 2_800_000,
      99  => 13_500_000,
      115 => 67_000_000,
      119 => 96_000_000
    }
    @exact_experiences = {
      12_031     => 29,
      123_660    => 52,
      737_627    => 70,
      11_805_606 => 98,
      52_136_868 => 113
    }
  end

  it "should successfully convert experience to level" do
    @sliding_experiences.each do |key, value|
      converted = Partyhat::Util.experience_to_level(value)
      converted.should eq(key)
    end
  end

  it "should successfully convert level to experience" do
    @exact_experiences.each do |key, value|
      converted = Partyhat::Util.level_to_experience(value)
      converted.should eq(key)
    end
  end
end