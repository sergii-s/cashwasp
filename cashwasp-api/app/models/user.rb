class User < ApplicationRecord
    has_many :bank_accounts, dependent: :destroy

    # validations
    validates_presence_of :email, :name
end
