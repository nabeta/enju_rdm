class CreateDoiRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :doi_records, id: :uuid do |t|
      t.string :identifier, index: { unique: true }, null: false
      t.references :dataset, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
