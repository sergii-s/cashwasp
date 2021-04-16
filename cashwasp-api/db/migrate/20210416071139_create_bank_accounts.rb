class CreateBankAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_accounts do |t|
      t.string :auth
      t.string :label
      t.string :holder
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
