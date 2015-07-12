class Publisher < ActiveRecord::Base
  has_many :reports
  belongs_to :group

  validates :first_name, :last_name, presence: true

  scope :inactive, -> { where(is_inactive: true) }
  scope :active, -> { where(is_inactive: false) }
  scope :pioneers, -> { where(is_pioneer: true) }
  scope :elders, -> { where(is_elder: true) }
  scope :servants, -> { where(is_servant: true) }
  scope :appointed, -> { where("is_elder = ? or is_servant = ?", true, true) }
  scope :not_pioneering, -> { active.where(is_pioneer: false) }

  # TODO: check for inactivity
  # A publisher is inactive if they have not reported any hours in the past
  # six months.
  def active?
    reports.order(id: :desc).limit(6).sum(:hours) > 0
  end
end
