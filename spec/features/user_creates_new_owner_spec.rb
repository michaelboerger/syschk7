require 'spec_helper'

feature "User creates new owner", %Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do
  # Acceptance Criteria:

  # * I must specify a first name, last name, and email address (yay)
  # * I can optionally specify a company name (yay)
  # * If I do not specify the required information, I am presented with errors (yay)
  # * If I specify the required information, the owner is recorded (yay)
  #   and I am redirected to enter another new owner (boo)

  before :each do
    @owner = FactoryGirl.build(:owner)
    visit new_owner_path
  end

  scenario "With valid attributes" do
    prev_count = Owner.count

    fill_in "First name", with: @owner.first_name
    fill_in "Last name", with: @owner.last_name
    fill_in "Email", with: @owner.email
    fill_in "Company", with: @owner.company

    click_on "This person owns a BUILDING!! Whoa!"

    expect(page).to have_content ("But, if you really think about it, can anyone really OWN a building?")
    expect(Owner.count).to eq prev_count + 1
  end


   scenario "without required attributes" do
    click_on "This person owns a BUILDING!! Whoa!"

    expect(page).to have_content ("First namecan't be blank")
    expect(page).to have_content ("Last namecan't be blank")
    expect(page).to have_content ("Emailcan't be blank")
  end
end
