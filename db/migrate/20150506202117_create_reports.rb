class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :books, default: 0
      t.integer :brochures, default: 0
      t.integer :magazines, default: 0
      t.integer :visits, default: 0
      t.integer :studies, default: 0
      t.float :hours, default: 0.0
      t.boolean :is_auxilliary_pioneer, default: false
      t.boolean :is_recorded, default: false
      t.references :publisher
      t.date :reported_at, default: nil

      t.timestamps null: false
    end
  end
end
