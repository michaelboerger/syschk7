require 'spec_helper'

feature "User creates new building", %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

# Acceptance Criteria:

# * I must specify a street address, city, state, and postal code
# * Only US states can be specified
# * I can optionally specify a description of the building
# * If I enter all of the required information in the required format,
#   the building is recorded.
# * If I do not specify all of the required information in the required formats,
#   the building is not recorded and I am presented with errors
# * Upon successfully creating a building, I am redirected
#   so that I can record another building.

  before :each do
    @building = FactoryGirl.build(:building)
    visit new_building_path
  end

  scenario "with valid attributes" do
    prev_count = Building.count
    # I hope Helen reviews this because she was very passionate about making sure
    # things were added to the database in the user tests. If you aren't Helen
    # she has proof that Dan did it once, just ask her.

    fill_in "Street address", with: @building.street_address
    fill_in "City", with: @building.city
    fill_in "State", with: @building.state
    fill_in "Postal code", with: @building.postal_code
    fill_in "Description", with: @building.description

    click_on "USER FRIENDLY BUILDING ADDITION BUTTON"

    expect(page).to have_content (@building.street_address)
    expect(page).to have_content (@building.city)
    expect(page).to have_content (@building.state)
    expect(page).to have_content (@building.postal_code)
    expect(page).to have_content (@building.description)
    expect(page).to have_content ("More buildings for the building empire")
    expect(Building.count).to eq prev_count + 1
  end

  scenario "without valid attributes" do
    # BAD STUFF HAPPENS
  end
end
