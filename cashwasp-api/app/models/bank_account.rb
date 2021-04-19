class BankAccount < ApplicationRecord
    belongs_to :user
    has_many :egress_transfers, :class_name => 'Transfer', :foreign_key => "source_id"
    has_many :ingress_transfers, :class_name => 'Transfer', :foreign_key => "destination_id"

    # validation
    validates_presence_of :auth, :label, :holder, :account_type
end
