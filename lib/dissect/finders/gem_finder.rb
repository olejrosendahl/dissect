module Dissect
  module Finders
    class GemFinder < Base

      def find(organization, name)
        super(organization, name, "ruby")
      end

    end
  end
end
