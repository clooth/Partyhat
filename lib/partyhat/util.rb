class Partyhat::Util
  # Convert an experience value to a level
  # Uses a formula from somewhere.
  # TODO: Add source for formula.
  def self.experience_to_level experience
    modifier = 0
    (1..200).each do |n|
      modifier += (n + 300 * (2 ** (n.to_f/7.0))).floor
      level     = (modifier/4).floor
      return n if experience < level
    end
    200
  end

  # Convert a level value into experience
  # Uses a formula from somewhere.
  # TODO: Add source for formula.
  def self.level_to_experience level
    experience = 0
    (1..level-1).each do |n|
      experience += (n + 300 * (2 ** (n.to_f/7.0))).floor
    end
    (experience/4).floor
  end
end