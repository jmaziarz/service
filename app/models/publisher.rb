class Publisher < ActiveRecord::Base
  has_many :reports
  belongs_to :group
end