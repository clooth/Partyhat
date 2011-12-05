class Partyhat::Activity < Partyhat::Stat
  @name       = nil
  @score      = nil
  @rank 			= nil

  def initialize name, score, rank
    raise ArgumentError, 'Invalid activity name' unless ActivitiesList.include? name
    @name       = name

    # Nilify negative values
    @score      = score < 0 ? nil : score
    @rank       = rank < 0 ? nil : rank
  end

  def name
    @name
  end

  def human_name
    Partyhat::Stat.human_name_for @name
  end

  def score
    @score
  end

  def rank
    @rank
  end
end