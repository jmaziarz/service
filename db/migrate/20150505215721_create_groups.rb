class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :overseer_id
      t.integer :assistant_id

      t.timestamps null: false
    end
  end
end
