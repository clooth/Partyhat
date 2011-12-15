module Partyhat
  module Calculators
    # Calculate a user's combat level with the given stats hash
    # The method defaults to runescape starter stats if any of
    # the skills are missing from the hash.
    def self.combat stats
      return nil if stats.nil? || stats.empty?
      # Default combat calculator stats
      default_stats = {
        :attack       => 1,
        :defence      => 1,
        :strength     => 1,
        :constitution => 10,
        :ranged       => 1,
        :prayer       => 1,
        :magic        => 1,
        :summoning    => 1
      }
      # Replace non-set values with defaults
      values = default_stats.inject({}) { |h, (k, v)| h[k] = stats[k].level.to_i || v; h }

      # Level calculations
      base_level = (values[:defence] + values[:constitution] + (values[:prayer] / 2).floor + (values[:summoning] / 2).floor) * 0.25
      base_melee = (values[:attack] + values[:strength]) * 0.325
      base_range = (values[:ranged] * 1.5).floor * 0.325
      base_magic = (values[:magic] * 1.5).floor * 0.325

      combat_level = base_level + [base_melee, base_range, base_magic].max

      # Remainder calculations
      remainder_diff = combat_level + 1
      remainder_diff = combat_level.ceil - combat_level if combat_level.is_a?(Float)
      remainders = {
        :strength_attack      => (remainder_diff / (1.0/3.0)).ceil,
        :defence_constitution => (remainder_diff / 0.25).ceil,
        :prayer_summoning     => (remainder_diff / 0.125).ceil
      }

      { :level      => combat_level,
        :remainders => remainders }
    end
  end
end