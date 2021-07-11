class CreateCollectionAndDatasets < ActiveRecord::Migration[6.1]
  def change
    create_table :collection_and_datasets, id: :uuid do |t|
      t.references :collection, null: false, foreign_key: true, type: :uuid
      t.references :dataset, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
