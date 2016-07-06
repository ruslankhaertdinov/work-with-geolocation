require "rails_helper"

feature "Map on home page", :js do
  scenario "Visitor sees map" do
    visit root_path
    expect(page).to have_css(".gm-style")
  end
end
