# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :owner do
    first_name "Rich"
    last_name "Idiot"
    email "BigShot@robberbarons.com"
    company "Money Inc"
  end
end
