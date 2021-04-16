class BankAccount < ApplicationRecord
    belongs_to :user

    # validation
    validates_presence_of :auth, :label, :holder, :type
end
