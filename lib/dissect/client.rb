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
      result = [].tap do |results|
        PATTERNS.each do |pattern|
          results << @connection.get("/search/code", q: query_string(pattern, gem, organisation, language))
        end
      end
      merge_results(result)
    end

    private

    def merge_results(sawyer_resources)
      merged_results = { total_count: 0, incomplete_results: false, items: [] }
      sawyer_resources.each do |resource|
        merged_results[:total_count] += resource.to_hash[:total_count]
        merged_results[:incomplete_results] &&= resource.to_hash[:incomplete_results]
        merged_results[:items] += resource.to_hash[:items]
      end
      merged_results
    end

    def query_string(pattern, gem, user, language)
      sprintf(pattern, gem) + " user:#{user} language:#{language}"
    end

  end
end
