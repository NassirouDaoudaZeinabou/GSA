class CreateEtablissements < ActiveRecord::Migration[8.0]
  def change
    create_table :etablissements do |t|
      t.string :nom
      t.string :type_etablissement

      t.timestamps
    end
  end
end
