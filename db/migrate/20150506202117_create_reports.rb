class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :month
      t.string :year
      t.integer :books
      t.integer :brochures
      t.integer :magazines
      t.integer :visits
      t.integer :studies
      t.float :hours
      t.boolean :is_auxilliary_pioneer
      t.boolean :is_recorded
      t.references :publisher

      t.timestamps null: false
    end
  end
end
