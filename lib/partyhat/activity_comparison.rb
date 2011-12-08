module Partyhat
  class ActivityComparison
    @first_activity  = nil
    @second_activity = nil
    @score           = nil
    @rank            = nil

    def initialize first_activity, second_activity
      # Check the classes so they don't fail
      unless (first_activity.class == Partyhat::Activity) && (second_activity.class == Partyhat::Activity)
        raise InvalidArgumentError 'You can only compare two Partyhat::Activity objects.'
      end
      # Assign instance variables
      @first_activity  = first_activity
      @second_activity = second_activity
      # Perform comparison
      @score = @second_activity.score - @first_activity.score
      @rank  = @second_activity.rank - @first_activity.rank
    end

    def score
      @score
    end

    def rank
      @rank
    end
  end
end