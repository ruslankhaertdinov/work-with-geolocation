require "rails_helper"

describe RequestLocation do
  let(:service) { described_class.new(location) }

  describe "#to_h" do
    subject { service.to_h }

    context "when location empty" do
      let(:default_result) { { latitude: 37.773972, longitude: -122.431297 }.stringify_keys }
      let(:location)       { nil }

      it "returns default coordinates" do
        expect(subject).to eq(default_result)
      end
    end

    context "when location exists" do
      let(:location) { { latitude: 55.1234, longitude: 45.1234 }.stringify_keys }

      it "returns actual coordinates" do
        expect(subject).to eq(location)
      end
    end
  end
end
