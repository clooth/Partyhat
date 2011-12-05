class Partyhat::SkillComparison
  @first_skill  = nil
  @second_skill = nil
  @level        = nil
  @experience   = nil
  @rank         = nil

  def initialize first_skill, second_skill
    # Check the classes so they don't fail
    unless (first_skill.class == Partyhat::Skill) && (second_skill.class == Partyhat::Skill)
      raise InvalidArgumentError 'You can only compare two Skill objects.'
    end
    # Assign instance variables
    @first_skill  = first_skill
    @second_skill = second_skill
    # Perform comparison
    @level        = @second_skill.level - @first_skill.level
    @experience   = @second_skill.experience - @first_skill.experience
    @rank         = @second_skill.rank - @first_skill.rank
  end

  def level
    @level
  end

  def experience
    @experience
  end

  def rank
    @rank
  end
end