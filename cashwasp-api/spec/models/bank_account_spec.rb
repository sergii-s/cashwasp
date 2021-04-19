require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  # Association test
  it { should belong_to(:user) }
  it { should have_many(:ingress_transfers).with_foreign_key('destination_id') }
  it { should have_many(:egress_transfers).with_foreign_key('source_id') }
  # Validation test
  it { should validate_presence_of(:auth) }
  it { should validate_presence_of(:label) }
  it { should validate_presence_of(:holder) }
  it { should validate_presence_of(:account_type) }
end
