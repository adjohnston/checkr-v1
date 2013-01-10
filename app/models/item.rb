class Item < ActiveRecord::Base
  attr_accessible :desc, :is_checked, :list_id, :name, :url
end
