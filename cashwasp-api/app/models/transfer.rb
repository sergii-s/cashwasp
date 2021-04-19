class Transfer < ApplicationRecord
  belongs_to :source, :class_name => 'BankAccount', :foreign_key => 'source_id'
  belongs_to :destination, :class_name => 'BankAccount', :foreign_key => 'destination_id'

  validates_presence_of :amount
end
