class CreateTransfers < ActiveRecord::Migration[6.1]
  def change
    create_table :transfers do |t|
      t.numeric :amount
      t.references :source, null: false, index: true, foreign_key: { to_table: :bank_accounts }
      t.references :destination, null: false, index: true, foreign_key: { to_table: :bank_accounts }

      t.timestamps
    end
  end
end
