class Partyhat::Stat
  # List of skills that appear in the highscores
  SkillsList = [
    :attack,
    :defence,
    :strength,
    :constitution,
    :ranged,
    :prayer,
    :magic,
    :cooking,
    :woodcutting,
    :fletching,
    :fishing,
    :firemaking,
    :crafting,
    :smithing,
    :mining,
    :herblore,
    :agility,
    :thieving,
    :slayer,
    :farming,
    :runecrafting,
    :hunter,
    :construction,
    :summoning,
    :dungeoneering
  ]

  # List of activities that appear in the highscores
  ActivitiesList = [
    :duel_tournament,
    :bounty_hunters,
    :bounty_hunter_rogues,
    :fist_of_guthix,
    :mobilising_armies,
    :ba_attackers,
    :ba_defenders,
    :ba_collectors,
    :ba_healers,
    :castle_wars_games,
    :conquest,
    :dominion_tower
  ]

  # List of skills that count in your combat level
  CombatSkillsList = [
    :attack,
    :defence,
    :strength,
    :constitution,
    :ranged,
    :prayer,
    :magic,
    :summoning
  ]

  # List of all stats that can belong to a player
  List = [:overall] + SkillsList + ActivitiesList

  # Human readable names for all skills and activities
  HumanNames = {
    :overall              => 'Overall',
    :attack               => 'Attack',
    :defence              => 'Defence',
    :strength             => 'Strength',
    :constitution         => 'Constitution',
    :ranged               => 'Ranged',
    :prayer               => 'Prayer',
    :magic                => 'Magic',
    :cooking              => 'Cooking',
    :woodcutting          => 'Woodcutting',
    :fletching            => 'Fletching',
    :fishing              => 'Fishing',
    :firemaking           => 'Firemaking',
    :crafting             => 'Crafting',
    :smithing             => 'Smithing',
    :mining               => 'Mining',
    :herblore             => 'Herblore',
    :agility              => 'Agility',
    :thieving             => 'Thieving',
    :slayer               => 'Slayer',
    :farming              => 'Farming',
    :runecrafting         => 'Runecrafting',
    :hunter               => 'Hunter',
    :construction         => 'Construction',
    :summoning            => 'Summoning',
    :dungeoneering        => 'Dungeoneering',
    :duel_tournament      => 'Duel Tournament',
    :bounty_hunters       => 'Bounty Hunters',
    :bounty_hunter_rogues => 'Bounty Hunter Rogues',
    :fist_of_guthix       => 'Fist of Guthix',
    :mobilising_armies    => 'Mobilising Armies',
    :ba_attackers         => 'B.A Attackers',
    :ba_defenders         => 'B.A Defenders',
    :ba_collectors        => 'B.A Collectors',
    :ba_healers           => 'B.A Healers',
    :castle_wars_games    => 'Castle Wars Games',
    :conquest             => 'Conquest',
    :dominion_tower       => 'Dominion Tower'
  }

  # Get the human readable name for a stat name
  #
  # * returns 'Undefined' if not found
  def self.human_name_for stat
    HumanNames[stat] || 'Undefined'
  end
end