class AddTitleToDataset < ActiveRecord::Migration[6.1]
  def change
    add_column :datasets, :title, :text, null: false
    add_column :datasets, :alternative_title, :text
    add_column :datasets, :description, :text
    add_column :datasets, :date_published, :date
    add_column :datasets, :resource_type, :integer, null: false, default: 0
    add_column :datasets, :manuscript_type, :integer, null: false, default: 0
  end
end
