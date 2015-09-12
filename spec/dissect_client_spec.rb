require "spec_helper"

describe Dissect::Client do

  describe "#code_search(gem, organisation, language)" do
    it "finds matching repos using gem" do
      VCR.use_cassette(:code_search) do
        result = subject.code_search("rails", "thoughtbot", "ruby").first
        expect(result.total_count).to eq(34)

        finding = result.items.first
        expect(finding.name).to eq("Gemfile")
        expect(finding.path).to eq("/Gemfile")
        expect(finding.html_url).to eq("https://github.com/thoughtbot/hound/blob/d194761d639e1786fabbc753167050b36ca522df//Gemfile")
        expect(finding.repository.name).to eq("hound")
      end
    end
  end

end
