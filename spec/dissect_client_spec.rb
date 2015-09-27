require "spec_helper"

module Dissect
  describe Client do
    describe "#code_search(organization, gem_name, language)" do
      let(:findings) do
        VCR.use_cassette(:code_search) do
          subject.code_search("thoughtbot", "devise", "ruby")
        end
      end

      it "finds matching repos using gem" do
        expect(findings.length).to be(4)
        finding = findings.first

        expect(finding).to be_instance_of(Models::Finding)
        expect(finding.name).to eq("Gemfile")
        expect(finding.path).to eq("/Gemfile")
        expect(finding.html_url).to eq("https://github.com/thoughtbot/podcasts/blob/f29ba7680abecaa80a7995268b0d2bbdf48719c6//Gemfile")
        expect(finding.repository_name).to eq("podcasts")
      end
    end
  end
end
