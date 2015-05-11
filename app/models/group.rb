class Group < ActiveRecord::Base
  has_many :publishers
  has_many :reports, through: :publishers
  has_one :overseer, class_name: 'Publisher'
  has_one :assistant, class_name: 'Publisher'
end
