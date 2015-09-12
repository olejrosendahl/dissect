require "spec_helper"

describe Dissect::Formatters::Json do
  let(:result) do
    Object.new
  end

  subject { described_class.new(result) }

  describe "#format(result)" do
    it "extracts relevant data and converts result to JSON" do
      expect(subject.format).to eq(
        ""
      )
    end
  end

end
