class CreateAgents < ActiveRecord::Migration[8.0]
  def change
    create_table :agents do |t|
      t.string :nom
      t.string :prenom
      t.string :matricule
      t.decimal :budget_sante
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
