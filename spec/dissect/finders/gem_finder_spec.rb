require "spec_helper"

module Dissect
  module Finders
    describe GemFinder do
      describe "#find(organization, name)" do

        it "finds matching repos using gem" do
          VCR.use_cassette(:code_search) do
            findings = subject.find("thoughtbot", "devise")

            expect(findings.length).to be(2)
            finding = findings.first

            expect(finding).to be_instance_of(Models::Finding)
            expect(finding.name).to eq("Gemfile")
            expect(finding.path).to eq("/Gemfile")
            expect(finding.html_url).to eq("https://github.com/thoughtbot/podcasts/blob/f29ba7680abecaa80a7995268b0d2bbdf48719c6//Gemfile")
            expect(finding.repository_name).to eq("podcasts")
            expect(finding.description).to eq("Gemfile")
            expect(finding.score).to eq(7.2319107)
          end
        end

        it "searches multiple organizations" do
          VCR.use_cassette(:code_search_multiple_orgs) do
            findings = subject.find(["thoughtbot", "plataformatec"], "rails")
            expect(findings.first.owner_name).to_not eq(findings.last.owner_name)
          end
        end

      end
    end
  end
end
