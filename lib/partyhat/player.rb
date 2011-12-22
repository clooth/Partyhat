#
# Partyhat - Runescape Utility Gem
# Feature: Player object
# Description: Class for player-specific functionality and data
# Author: clooth <zenverse@gmail.com>
#
module Partyhat
  class Player
    @name  = nil
    @stats = nil

    # Initialize a new player object by name
    # Will raise an error on invalid
    def initialize name, get_stats=true
      @name = name
      @stats = Partyhat::Highscores.find_player(@name)
    end

    attr_reader :name, :stats

    def combat
      Partyhat::Calculators.combat(stats)
    end

    def adventurers_log

    end
  end
end
# End of Partyhat::Player