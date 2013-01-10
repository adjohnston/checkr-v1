class Item < ActiveRecord::Base
  belongs_to :list

  attr_accessible :desc, :is_checked, :list_id, :name, :url

  validates :name, presence: true
end
