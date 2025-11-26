class CreateSousClients < ActiveRecord::Migration[8.0]
  def change
    create_table :sous_clients do |t|
      t.string :nom
      t.string :prenom
      t.string :relation
      t.references :agent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
