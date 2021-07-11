class CreateThumbnails < ActiveRecord::Migration[6.1]
  def change
    create_table :thumbnails, id: :uuid do |t|
      t.references :dataset, null: false, foreign_key: true, type: :uuid
      t.references :fileset, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
