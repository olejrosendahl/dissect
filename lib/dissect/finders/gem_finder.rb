module Dissect
  module Finders
    class GemFinder < BaseFinder

      def find(organization, name)
        super(organization, name, "ruby")
      end

    end
  end
end
