#
# Partyhat - Runescape Utility Gem
# Feature: Activity object
# Description: Class for handling activities
# Author: clooth <zenverse@gmail.com>
#
module Partyhat
  class Activity < Partyhat::Stat
    @name  = nil
    @score = nil
    @rank  = nil

    def initialize name, score, rank
      # Validate activity name
      unless ActivitiesList.include? name
        raise ArgumentError, "Invalid Activity Name: #{name}"
      end

      @name  = name
      @score = score < 0 ? nil : score
      @rank  = rank  < 0 ? nil : rank
    end

    attr_reader :name, :score, :rank

    # Get the human readable name for this activity
    # If no human name is found, returns "Undefined"
    def human_name
      Partyhat::Stat.human_name_for @name
    end

    # Compare this activity to another one
    # Returns an ActivityComparison instance
    def compare_to another_activity
      Partyhat::ActivityComparison.new(self, another_activity)
    end
  end
end
