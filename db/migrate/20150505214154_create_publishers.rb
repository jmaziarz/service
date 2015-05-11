class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.boolean :is_pioneer, default: false
      t.boolean :is_elder, default: false
      t.boolean :is_servant, default: false
      t.boolean :is_inactive, default: false

      t.timestamps null: false
    end
  end
end
