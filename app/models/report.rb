class Report < ActiveRecord::Base
  belongs_to :publisher

  before_create :set_default_reported_at

  def self.current
    if Date.current.day <= 20
      by_month(Date.current.prev_month.month)
    else
      by_month(Date.current.month)
    end
  end

  def self.by_year(year)
    date = Date.new(year)
    boy = date.beginning_of_year
    eoy = date.end_of_year
    where("reported_at >= ? and reported_at <= ?", boy, eoy)
  end

  def self.by_month(month, year = Date.current.year)
    date = Date.new(year, month)
    bom = date.beginning_of_month
    eom = date.end_of_month
    where("reported_at >= ? and reported_at <= ?", bom, eom)
  end

  def self.by_publishers
    where(is_auxilliary_pioneer: false).joins(:publisher).merge(Publisher.active_but_not_pioneers)
  end

  def self.by_auxilliary_pioneers
    where(is_auxilliary_pioneer: true)
  end

  def self.by_pioneers
    joins(:publisher).merge(Publisher.pioneers)
  end

  private

  def set_default_reported_at
    if reported_at.nil?
      write_attribute(:reported_at, Date.current.prev_month.beginning_of_month)
    end
  end
end
