require "dissect/version"
require "octokit"

module Dissect
  class Client

    def initialize
      @connection = Octokit::Client.new
    end

    def search(string, organisation, language)
      @connection.get "/search/code", q: "#{string} user:#{organisation} language:#{language}"
    end

  end
end
