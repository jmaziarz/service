class Report < ActiveRecord::Base
  belongs_to :publisher

  #before_create :set_default_reported_at

  def self.current
    if Date.current.day <= 20
      by_month(Date.current.prev_month.month)
    else
      by_month(Date.current.month)
    end
  end

  def self.by_year(year)
    date = Date.new(year)
    where("reports.report_for >= ? and reports.report_for <= ?", date.beginning_of_year, date.end_of_year)
  end

  def self.by_month(month, year = Date.current.year)
    date = Date.new(year, month)
    where(report_for: date.beginning_of_month)
  end

  def self.by_publishers
    where(is_auxilliary_pioneer: false).joins(:publisher).merge(Publisher.not_pioneering)
  end

  def self.by_auxilliary_pioneers
    where(is_auxilliary_pioneer: true)
  end

  def self.by_pioneers
    joins(:publisher).merge(Publisher.pioneers)
  end

  def self.not_reported
    where(reported_at: nil)
  end

  private

  def set_default_reported_at
    if reported_at.nil?
      write_attribute(:reported_at, Date.current.prev_month.beginning_of_month)
    end
  end
end
