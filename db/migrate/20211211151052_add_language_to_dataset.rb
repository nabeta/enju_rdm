class AddLanguageToDataset < ActiveRecord::Migration[6.1]
  def change
    add_column :datasets, :language, :integer, null: false, default: 1
  end
end
