require 'spec_helper'

feature "User correlates owner with building", %Q{
  As a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information
} do
  # Acceptance Criteria:

  # * When recording a building, I want to optionally associate the building
  #   with its rightful owner.
  # * If I delete an owner, the owner and its primary key should no
  #   longer be associated with any properties.

  # Um, I don't really know how to do this, it will be an ugly mess, FAIR WARNING

  before :each do
    @building = FactoryGirl.create(:building)
    @owner = FactoryGirl.create(:owner)
    visit new_owner_path
  end

  # scenario "Some jerk gets a building" do

  # end


  scenario "The owner stops existing" do
    visit owners_url
    expect(page).to have_content(@owner.first_name)
    expect(page).to have_content(@owner.last_name)
    click_on 'NO ONE CAN OWN A BUILDING'
    expect(page).to_not have_content(@owner.first_name)
    expect(page).to_not have_content(@owner.last_name)
  end
end
