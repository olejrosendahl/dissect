require "spec_helper"

module Dissect
  module Finders
    describe GemFinder do
      describe "#find(organization, name)" do

        let(:findings) do
          VCR.use_cassette(:code_search) do
            subject.find("thoughtbot", "devise")
          end
        end

        it "finds matching repos using gem" do
          expect(findings.length).to be(2)
          finding = findings.first

          expect(finding).to be_instance_of(Models::Finding)
          expect(finding.name).to eq("Gemfile")
          expect(finding.path).to eq("/Gemfile")
          expect(finding.html_url).to eq("https://github.com/thoughtbot/podcasts/blob/f29ba7680abecaa80a7995268b0d2bbdf48719c6//Gemfile")
          expect(finding.repository_name).to eq("podcasts")
          expect(finding.description).to eq("Gemfile")
          expect(finding.score).to eq(7.2116995)
        end

      end
    end
  end
end
