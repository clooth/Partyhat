require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Partyhat::Util" do
  before :all do
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
      29  => 12_031,
      52  => 123_660,
      70  => 737_627,
      98  => 11_805_606
    }
    @numbers_and_shorts = {
      55_000        => '55.0K',
      123_500       => '123.5K',
      5_123_000     => '5.1M',
      123_100_000   => '123.1M',
      4_500_000_000 => '4.5B'
    }
    @shorts_and_numbers = {
      '55.0K'  => 55_000,
      '55.5K'   => 55_500,
      '123.54K' => 123_540,
      '5.123M'  => 5_123_000,
      '123.12M' => 123_120_000,
      '4.72B'   => 4_720_000_000
    }
  end

  context "Experience to Level" do
    it "should successfully convert experience to level" do
      @sliding_experiences.each do |key, value|
        converted = Partyhat::Util.experience_to_level(value)
        converted.should eq(key)
      end
    end

    it "should return a maximum level of 200" do
      Partyhat::Util.experience_to_level(500_000_000_000).should eq(200)
    end
  end

  context "Level to experience" do
    it "should successfully convert level to experience" do
      @exact_experiences.each do |key, value|
        converted = Partyhat::Util.level_to_experience(key)
        converted.should eq(value)
      end
    end
  end

  context "Shortening and parsing numbers" do
    it "should be able to shorten a number" do
      @numbers_and_shorts.each do |number, short|
        Partyhat::Util.shorten_number(number).should eq(short)
      end
    end

    it "should be able to parse a number" do
      @shorts_and_numbers.each do |short, number|
        Partyhat::Util.parse_number(short).should eq(number)
      end
    end
  end
end