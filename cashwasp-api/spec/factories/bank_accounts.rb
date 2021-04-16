FactoryBot.define do
    factory :bank_account do
        auth { Faker::Bank.iban }
        label { Faker::Business.name }
        holder { Faker::Bank.name }
        account_type { "private account" }
        user_id nil
    end
end
