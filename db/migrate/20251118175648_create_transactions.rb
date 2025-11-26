class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.decimal :montant
      t.string :type_transaction
      t.date :date
      t.references :agent, null: false, foreign_key: true
      t.references :sous_client, null: false, foreign_key: true
      t.references :etablissement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
