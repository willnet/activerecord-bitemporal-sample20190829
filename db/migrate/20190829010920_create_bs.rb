class CreateBs < ActiveRecord::Migration[5.2]
  def change
    create_table :bs do |t|
      t.string :name
      t.integer :bitemporal_id
      t.datetime :valid_from
      t.datetime :valid_to
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
