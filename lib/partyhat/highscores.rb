module Partyhat
  module Highscores
    HIGHSCORES_PAGE_URL = 'http://hiscore.runescape.com/index_lite.ws?player=%s'

    # Fetch a user's highscores object
    def self.find_player name
      page_url = HIGHSCORES_PAGE_URL % URI::encode(name)
      page_src = Partyhat::Util.fetch_remote(page_url)
      self.parse_lite_page(page_src) unless page_src.nil?
    end

    # Parse the result page from the highscores into
    # A hash containing skill/activity objects with
    # the corresponding stat name as key.
    def self.parse_lite_page page
      lite_page_lines = page.split("\n")
      user_stats = {}
      Partyhat::Stat::List.each do |stat|
        line_parts = lite_page_lines.shift.split(',').map(&:to_i)
        if line_parts.size == 3
          rank, level, experience = line_parts.shift, line_parts.shift, line_parts.shift
          user_stats[stat]        = Partyhat::Skill.new(stat, level, experience, rank)
        else
          rank, score      = line_parts.shift, line_parts.shift
          user_stats[stat] = Partyhat::Activity.new(stat, score, rank)
        end
      end
      user_stats
    end
  end
end