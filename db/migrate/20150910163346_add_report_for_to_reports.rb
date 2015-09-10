class AddReportForToReports < ActiveRecord::Migration
  def change
    add_column :reports, :report_for, :date
  end
end
