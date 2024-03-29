require 'spec_helper'

describe Building do

  it { should validate_presence_of(:street_address) }

  it { should validate_presence_of(:city) }

  it { should validate_presence_of(:state) }

  it { should validate_presence_of(:postal_code) }

end
