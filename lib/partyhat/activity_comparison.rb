#
# Partyhat - Runescape Utility Gem
# Feature: ActivityComparison object
# Description: Class for handling comparisons between two activities
# Author: clooth <zenverse@gmail.com>
#
module Partyhat
  class ActivityComparison
    @first_activity  = nil
    @second_activity = nil
    @score           = nil
    @rank            = nil

    def initialize first_activity, second_activity
      # Assign instance variables
      @first_activity  = first_activity
      @second_activity = second_activity

      validate_classes

      # If first activity is nil and second is not, second wins
      if @first_activity.score.nil? && !@second_activity.score.nil?
        @score = @second_activity.score
        @rank  = @second_activity.rank
      # If the second activity is nil and the first is not, first wins
      elsif @second_activity.score.nil? && !@first_activity.score.nil?
        @score = @first_activity.score
        @rank  = @first_activity.rank
      # If both are nil
      elsif @first_activity.score.nil? && @second_activity.score.nil?
        @score = nil
        @rank = nil
      # Everything should be good
      else
        @score = @second_activity.score - @first_activity.score
        @rank  = @second_activity.rank - @second_activity.rank
      end
    end

    attr_reader :score, :rank

    private
    # Make sure the two classes being compared are both instances
    # of the Partyhat::Activity class
    def validate_classes
      [@first_activity.class, @second_activity.class].each do |class_name|
        unless class_name == Partyhat::Activity
          raise InvalidArgumentError "You can only compare two Activity instances"
        end
      end
    end
  end
end