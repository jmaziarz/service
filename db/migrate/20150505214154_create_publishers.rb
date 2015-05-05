class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.boolean :is_pioneer
      t.boolean :is_elder
      t.boolean :is_servant
      t.boolean :is_inactive

      t.timestamps null: false
    end
  end
end
