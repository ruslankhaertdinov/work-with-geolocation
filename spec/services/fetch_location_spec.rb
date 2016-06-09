require "rails_helper"

describe FetchLocation do
  let(:service) { described_class.new(location) }

  describe "#to_h" do
    subject { service.to_h }

    context "when location empty" do
      let(:location)       { nil }
      let(:default_result) { { "latitude" => FetchLocation::LATITUDE, "longitude" => FetchLocation::LONGITUDE } }

      it "returns default coordinates" do
        expect(subject).to eq(default_result)
      end
    end

    context "when location exists" do
      let(:location) { { "latitude" => 55.1234, "longitude" => 45.1234 } }

      it "returns actual coordinates" do
        expect(subject).to eq(location)
      end
    end
  end
end
