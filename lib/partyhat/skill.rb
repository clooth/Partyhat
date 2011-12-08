module Partyhat
  class Skill < Partyhat::Stat
    @name       = nil
    @level      = nil
    @experience = nil
    @rank       = nil

    def initialize name, level, experience, rank
      raise ArgumentError, 'Invalid skill name' unless SkillsList.include? name
      @name       = name

      # Nilify negative values
      @level      = level < 0 ? nil : level
      @experience = experience < 0 ? nil : experience
      @rank       = rank < 0 ? nil : rank
    end

    def name
      @name
    end

    def human_name
      Partyhat::Stat.human_name_for @name
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

    def compare_to another_skill
      Partyhat::SkillComparison.new(self, another_skill)
    end
  end
end