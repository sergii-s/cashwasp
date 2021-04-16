require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  # Association test
  it { should belong_to(:user) }
  # Validation test
  it { should validate_presence_of(:auth) }
  it { should validate_presence_of(:label) }
  it { should validate_presence_of(:holder) }
  it { should validate_presence_of(:account_type) }
end
