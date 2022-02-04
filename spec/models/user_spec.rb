require 'rails_helper'

RSpec.describe User, type: :model do
  
  # Validation tests
  # ensure name, email and password are present before save
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end
