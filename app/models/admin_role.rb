class AdminRole < ActiveRecord::Base
  has_many :admin_users
  has_and_belongs_to_many :ability_items

  validates_presence_of :name
end
