module Partyhat
	module Forums
    # TODO: Deleted post type
    # TODO: Make sure it cannot be instantiated with invalid information (date in the future etc)
    # TODO: Check for moderator posts
		class ForumPost
      @author   = nil
      @posted   = nil
      @contents = nil

      def initialize author, posted, contents
        @author   = author
        @posted   = posted
        @contents = contents
      end

      def author
        @author
      end

      def posted
        @posted
      end

      def contents
        @contents
      end
		end
	end
end