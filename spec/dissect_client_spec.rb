require "spec_helper"

describe Dissect::Client do

  describe "#search" do
    it "finds matching repos using gem" do
      VCR.use_cassette(:search) do
        response = subject.search("rails", "thoughtbot", "ruby")

        matching_item = response.items.first
        expect(matching_item.name).to eq("Appraisals")
        expect(matching_item.html_url).to eq("https://github.com/thoughtbot/paul_revere/blob/949fa541ec255ebb08456ccc54ec222f6c3a06b3//Appraisals")

        repo = matching_item.repository
        expect(repo.name).to eq("paul_revere")
        expect(repo.html_url).to eq("https://github.com/thoughtbot/paul_revere")
        expect(repo.description).to eq("A library for \"one off\" announcements in Rails apps.")
      end
    end
  end

end
