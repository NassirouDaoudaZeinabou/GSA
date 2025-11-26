class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients do |t|
      t.string :nom
      t.string :adresse
      t.decimal :budget_total_alloue

      t.timestamps
    end
  end
end
