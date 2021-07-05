class CreateDatasets < ActiveRecord::Migration[6.1]
  def change
    create_table :datasets, id: :uuid do |t|
      t.jsonb :json_attributes, default: {}, null: false
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
