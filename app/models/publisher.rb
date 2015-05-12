class Publisher < ActiveRecord::Base
  has_many :reports
  belongs_to :group

  scope :pioneers, -> { where(is_pioneer: true) }
  scope :elders, -> { where(is_elder: true) }
  scope :servants, -> { where(is_servant: true) }
  scope :inactive, -> { where(is_inactive: true) }
  scope :active, -> { where(is_inactive: false) }
  scope :appointed, -> { where("is_elder = ? or is_servant = ?", true, true) }
  scope :active_but_not_pioneers, -> { where("is_inactive = ? and is_pioneer = ?", false, false) }
end