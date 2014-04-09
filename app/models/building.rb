class Building < ActiveRecord::Base
  belongs_to :owner

  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true
end
