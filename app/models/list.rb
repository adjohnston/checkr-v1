class List < ActiveRecord::Base
  belongs_to :user

  attr_accessible :desc, :is_public, :name, :user_id

  validates :name, presence: true
end
