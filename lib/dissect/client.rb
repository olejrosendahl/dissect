module Dissect
  class Client

    PATTERNS = [
      "gem '%s' filename:Gemfile path:/",
      "gem \"%s\" filename:Gemfile path:/",
    ]

    def initialize
      @connection = Octokit::Client.new
    end

    def code_search(organization, gem_name, language)
      findings = []
      PATTERNS.each do |pattern|
        result = @connection.get("/search/code", q: query_string(pattern, gem_name, organization, language))
        result[:items].each do |item|
          findings << Models::Finding.new(item)
        end
      end
      findings
    end

    private

    def query_string(pattern, gem, user, language)
      sprintf(pattern, gem) + " user:#{user} language:#{language}"
    end

  end
end
