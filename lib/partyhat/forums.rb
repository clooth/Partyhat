require 'open-uri'
require 'nokogiri'

module Partyhat
  module Forums
    QUICK_FIND_CODE_FORMAT = /^\d+-\d+-\d+-\d+$/

    def self.get_thread_by_qfc qfc
      return nil unless valid_qfc?(qfc) == true
    end

    def self.valid_qfc? qfc
      return false if qfc.match(QUICK_FIND_CODE_FORMAT).nil?
      true
    end
  end
end