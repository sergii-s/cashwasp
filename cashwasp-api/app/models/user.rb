=begin
Q? I don't want to delete user from database. When the user is deleted I want to keep it.

Solution 1 : add is_archived property and delegate archiving logic to Concern. From Controller perspective it's
transparent. We delete/get/update user normally and Concern is doing his magic

Solution 2 : create new model ArchivedUser and move user to another table while deleting.

Which solution is more common for ruby users ?
(From code-perspective. Database-perspective solution 2 is clearly better)
=end

class User < ApplicationRecord
    has_many :bank_accounts, dependent: :destroy
    has_secure_password

    # validations
    validates_presence_of :email, :name, :password_digest
end
