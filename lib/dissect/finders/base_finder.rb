module Dissect
  module Finders
    class BaseFinder

      def initialize
        @connection = Octokit::Client.new
      end

      def find(organization, name, language)
        findings = []
        patterns.each do |pattern|
          query = "#{sprintf(pattern["pattern"], name)} filename:#{pattern["filename"]} path:#{pattern["path"]} language:#{language} " + build_user_string(organization)
          result = @connection.get("/search/code", q: query)
          result[:items].each do |item|
            findings << Models::Finding.new(item, pattern["description"])
          end
        end
        findings
      end

      private

      def build_user_string(users)
        "".tap do |s|
          Array(users).each do |user|
            s << "user:#{user} "
          end
        end.strip
      end

      def patterns
        JSON.parse(File.read("#{File.dirname(__FILE__)}/../../../patterns.json"))
      end

    end
  end
end
