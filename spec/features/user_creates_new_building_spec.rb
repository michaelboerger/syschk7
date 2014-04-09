require 'spec_helper'

feature "User creates new building", %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

# Acceptance Criteria:

# * I must specify a street address, city, state, and postal code (yay)
# * Only US states can be specified (boo)
# * I can optionally specify a description of the building (yay)
# * If I enter all of the required information in the required format,
#   the building is recorded. (yay)
# * If I do not specify all of the required information in the required formats,
#   the building is not recorded and I am presented with errors (yay)
# * Upon successfully creating a building, I am redirected
#   so that I can record another building. (boo)

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

    expect(page).to have_content ("I LOVED THAT BUILDING, THANKS!")

    # This is where I cheated because I couldn't test without the redirect
    # If it is before 8 this is a reminder to myself to fix this
    # If it is after 8 this is an excuse to whoever reviews this
    expect(Building.count).to eq prev_count + 1
    expect(current_path).to eq new_building_path
  end

   scenario "without required attributes" do
     click_on "USER FRIENDLY BUILDING ADDITION BUTTON"

     expect(page).to have_content ("Street addresscan't be blank")
     expect(page).to have_content ("Citycan't be blank")
     expect(page).to have_content ("Statecan't be blank")
     expect(page).to have_content ("Postal codecan't be blank")
   end
end
