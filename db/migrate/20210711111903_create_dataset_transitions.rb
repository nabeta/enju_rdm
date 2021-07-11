class CreateDatasetTransitions < ActiveRecord::Migration[6.1]
  def change
    create_table :dataset_transitions, id: :uuid do |t|
      t.string :to_state, null: false
      t.jsonb :metadata, default: {}, null: false
      t.integer :sort_key, null: false
      t.uuid :dataset_id, null: false
      t.boolean :most_recent, null: false

      # If you decide not to include an updated timestamp column in your transition
      # table, you'll need to configure the `updated_timestamp_column` setting in your
      # migration class.
      t.timestamps null: false
    end

    # Foreign keys are optional, but highly recommended
    add_foreign_key :dataset_transitions, :datasets

    add_index(:dataset_transitions,
              %i(dataset_id sort_key),
              unique: true,
              name: "index_dataset_transitions_parent_sort")
    add_index(:dataset_transitions,
              %i(dataset_id most_recent),
              unique: true,
              where: "most_recent",
              name: "index_dataset_transitions_parent_most_recent")
  end
end
