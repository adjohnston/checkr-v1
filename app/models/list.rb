class List < ActiveRecord::Base
  attr_accessible :desc, :is_public, :name, :user_id
end
