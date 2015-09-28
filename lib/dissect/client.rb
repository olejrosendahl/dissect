module Dissect
  class Client

    def initialize
      @connection = Octokit::Client.new
    end

    def code_search(organization, gem_name, language)
      findings = []
      patterns.each do |pattern|
        query = "#{sprintf(pattern["pattern"], gem_name)} filename:#{pattern["filename"]} path:#{pattern["path"]} user:#{organization} language:#{language}"
        result = @connection.get("/search/code", q: query)
        result[:items].each do |item|
          findings << Models::Finding.new(item, pattern["description"])
        end
      end
      findings
    end

    private

    def query_string(pattern, gem, user, language)
      sprintf(pattern, gem) + " user:#{user} language:#{language}"
    end

    private

    def patterns
      JSON.parse(File.read("#{File.dirname(__FILE__)}/../../patterns.json"))
    end

  end
end
