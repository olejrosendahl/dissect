require "spec_helper"

module Dissect
  module Models
    describe Organization do
      subject { described_class.new("thoughtbot") }

      describe "#name" do
        it "has a name" do
          expect(subject.name).to eq("thoughtbot")
        end
      end

      describe "#repositories" do
        it "fetches it's repositories" do
          expect(subject.repositories.first).to be_instance_of(Repository)
        end
      end
    end
  end
end
