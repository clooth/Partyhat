module Partyhat
  module Forums
    # TODO: Add pagination support
    #       e.g. thread.next_page
    class ForumThread
      URL_FORMAT = 'http://services.runescape.com/m=forum/forums.ws?%s'
      @posts     = []
      @link      = nil
      @qfc       = nil

      def initialize qfc
        raise InvalidArgumentError('Invalid quick find code') unless Forums.valid_qfc?(qfc)
        @posts = []
        @qfc   = qfc
        @link  = URL_FORMAT % qfc.gsub(/-/, ",")
        parse_from_page open(@link)
      end

      def title
        @title
      end

      def posts
        @posts
      end

      def link
        @link
      end

      def qfc
        @qfc
      end

    protected
      def parse_from_page page
        document = Nokogiri::HTML(page)
        # Get title
        @title = document.css('.BarFullTop span.G0').first.content
        # Get posts on the page
        document.css('#MainContent .message').each do |post|
          author, posted, contents = [post.css('.author'), post.css('.BubbleCreation span'), post.css('.msgcontents td')].map(&:text)
          @posts << Partyhat::Forums::ForumPost.new(author, posted, contents)
        end
      end
    end
  end
end