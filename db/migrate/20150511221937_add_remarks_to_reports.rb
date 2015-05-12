class AddRemarksToReports < ActiveRecord::Migration
  def change
    add_column :reports, :remarks, :string
  end
end
