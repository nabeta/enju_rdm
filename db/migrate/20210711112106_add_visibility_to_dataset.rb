class AddVisibilityToDataset < ActiveRecord::Migration[6.1]
  def change
    add_column :datasets, :visibility, :integer, null: false, default: 1
    add_index :datasets, :visibility
  end
end
