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
    @building = FactoryGirl.build(:building)
    @owner = FactoryGirl.build(:owner)
    visit new_owner_path
  end

  scenario "Some jerk gets a building" do

  end


  # scenario "The owner stops existing" do
  # end
end
