require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
  it { should have_many(:bank_accounts).dependent(:destroy) }
  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end

