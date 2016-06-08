require "rails_helper"

describe LocationsController, type: :controller do
  let(:response_body) { JSON.parse(response.body) }

  describe "GET index" do
    let!(:user_1) { create(:user, :with_position) }
    let!(:user_2) { create(:user, :with_position) }
    let!(:user_3) { create(:user) }
    let(:markers) do
      [
        {
          lat:  user_1.latitude,
          lng:  user_1.longitude,
          info: user_1.full_name
        },
        {
          lat:  user_2.latitude,
          lng:  user_2.longitude,
          info: user_2.full_name
        }
      ].map(&:stringify_keys)
    end

    it "returns markers list" do
      get :index
      expect(response_body).to match_array(markers)
    end
  end

  describe "#fetch" do
    let(:coords)          { { latitude: 37, longitude: -122 } }
    let(:expected_result) { { coords: coords }.deep_stringify_keys }

    it "fetches user location by ip address" do
      allow(RequestLocation).to receive_message_chain(:new, :to_h).and_return(coords)
      get :fetch

      expect(response_body).to eq(expected_result)
    end
  end
end
