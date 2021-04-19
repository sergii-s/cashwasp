require 'rails_helper'

RSpec.describe Transfer, type: :model do
  it { should belong_to(:source).with_foreign_key('source_id') }
  it { should belong_to(:destination).with_foreign_key('destination_id') }
  # Validation test
  it { should validate_presence_of(:amount) }
end
