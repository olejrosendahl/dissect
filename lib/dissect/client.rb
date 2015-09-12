module Dissect
  class Client

    PATTERNS = [
      "gem '%s' filename:Gemfile path:/",
      "gem \"%s\" filename:Gemfile path:/",
    ]

    def initialize
      @connection = Octokit::Client.new
    end

    def code_search(gem, organisation, language)
      [].tap do |results|
        PATTERNS.each do |pattern|
          results << @connection.get("/search/code", q: query_string(pattern, gem, organisation, language))
        end
      end
    end

    private

    def query_string(pattern, gem, user, language)
      sprintf(pattern, gem) + " user:#{user} language:#{language}"
    end

  end
end
