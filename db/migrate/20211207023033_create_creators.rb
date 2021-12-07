class CreateCreators < ActiveRecord::Migration[6.1]
  def change
    create_table :creators, id: :uuid do |t|
      t.references :dataset, null: false, foreign_key: true, type: :uuid
      t.string :name, null: false
      t.string :orcid
      t.string :ror
      t.string :affiliation
      t.integer :role, null: false, default: 1
      t.integer :position, null: false, default: 1

      t.timestamps
    end
    add_index :creators, :orcid
    add_index :creators, :ror
  end
end
