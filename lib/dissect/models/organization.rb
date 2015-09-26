module Dissect
  module Models
    class Organization < Dissect::Client
      attr_accessor :name

      def initialize(name)
        @name = name
      end

      def repositories
        [Repository.new]
      end

    end
  end
end
