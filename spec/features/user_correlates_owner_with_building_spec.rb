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

  before :each do
    @owner = FactoryGirl.build(:owner)
    visit new_owner_path
  end

  scenario "With valid attributes" do
  end


   scenario "without required attributes" do
  end
end
