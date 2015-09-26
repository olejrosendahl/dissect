require "spec_helper"

module Dissect
  describe Client do
    describe "#code_search(gem, organisation, language)" do
      it "finds matching repos using gem" do
        VCR.use_cassette(:code_search) do
          findings = subject.code_search("rails", "thoughtbot", "ruby")

          expect(findings.length).to be(60)

          finding = findings.first

          expect(finding).to be_instance_of(Models::Finding)
          expect(finding.name).to eq("Gemfile")
          expect(finding.path).to eq("/Gemfile")
          expect(finding.html_url).to eq("https://github.com/thoughtbot/hound/blob/d194761d639e1786fabbc753167050b36ca522df//Gemfile")
          expect(finding.repository_name).to eq("hound")
        end
      end
    end
  end
end
