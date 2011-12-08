module Partyhat
	module Forums
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