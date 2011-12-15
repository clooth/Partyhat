module Partyhat
  class Player
    @name  = nil
    @stats = nil

    def initialize name
      @name = name
      @stats = Partyhat::Highscores.find_player(@name)
    end

    def name
      @name
    end

    def stats
      @stats
    end

    def combat
      Partyhat::Calculators.combat(stats)
    end
  end
end