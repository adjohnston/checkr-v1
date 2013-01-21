class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  attr_accessible :desc, :is_public, :name, :user_id

  validates :name, presence: true
end
