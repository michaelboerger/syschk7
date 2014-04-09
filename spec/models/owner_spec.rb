require 'spec_helper'

describe Owner do
  it { should have_many(:buildings).dependent(:nullify) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
end
