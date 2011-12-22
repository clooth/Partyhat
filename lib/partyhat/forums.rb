module Partyhat
  module Forums
    QUICK_FIND_CODE_FORMAT = /^\d+-\d+-\d+-\d+$/

    def self.valid_qfc? qfc
      return false if qfc.match(QUICK_FIND_CODE_FORMAT).nil?
      true
    end
  end
end

require 'partyhat/forums/forum_post'
require 'partyhat/forums/forum_thread'