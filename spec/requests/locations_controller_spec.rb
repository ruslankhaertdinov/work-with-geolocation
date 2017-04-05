require "rails_helper"

describe LocationsController, type: :controller do
  let(:response_body) { JSON.parse(response.body) }

  describe "#fetch" do
    let(:coords)          { { "latitude" => 37, "longitude" => -122 } }
    let(:expected_result) { { "coords" => coords } }

    it "fetches user location by ip address" do
      allow(FetchLocation).to receive_message_chain(:new, :to_h).and_return(coords)
      get :fetch

      expect(response_body).to eq(expected_result)
    end
  end
end
