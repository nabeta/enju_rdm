class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews, id: :uuid do |t|
      t.references :dataset, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
