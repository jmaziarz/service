class Group < ActiveRecord::Base
  has_many :publishers
  has_many :reports, through: :publishers
  belongs_to :overseer, class_name: 'Publisher'
  belongs_to :assistant, class_name: 'Publisher'

  validates :name, presence: true
end
