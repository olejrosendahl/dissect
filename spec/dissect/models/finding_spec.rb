require "spec_helper"

module Dissect
  module Models
    describe Finding do
      let(:finding) do
        repository = Struct.new(:name).new("thoughtbot/podcasts")
        Struct.new(
          :name, :path, :html_url, :repository
        ).new(
          "podcasts", "/Gemfile", "https://example.com", repository
        )
      end
      subject { Finding.new(finding, "description") }

      describe "#to_json" do
        it "returns the finding in JSON" do
          expect(subject.to_json).to eq(
            "{\"name\":\"podcasts\",\"path\":\"/Gemfile\",\"html_url\":\"https://example.com\",\"repository_name\":\"thoughtbot/podcasts\"}"
          )
        end
      end

    end
  end
end
