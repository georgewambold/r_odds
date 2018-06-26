module ROdds
  module Odd
    class Base
      def format
        raise NotImplementedError, "Subclasses must impliment this themselves"
      end

      def to_s
        raise NotImplementedError, "Subclasses must impliment this themselves"
      end
    end
  end
end
