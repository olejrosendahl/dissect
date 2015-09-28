module Dissect
  module Models
    class Finding
      attr_accessor :item, :description

      def initialize(item, description)
        @item, @description = item, description
      end

      def name
        item.name
      end

      def path
        item.path
      end

      def html_url
        item.html_url
      end

      def repository_name
        item.repository.name
      end

    end
  end
end
