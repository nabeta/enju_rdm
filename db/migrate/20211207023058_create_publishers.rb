class CreatePublishers < ActiveRecord::Migration[6.1]
  def change
    create_table :publishers, id: :uuid do |t|
      t.references :dataset, null: false, foreign_key: true, type: :uuid
      t.string :name, null: false
      t.string :ror

      t.timestamps
    end
    add_index :publishers, :ror
  end
end
