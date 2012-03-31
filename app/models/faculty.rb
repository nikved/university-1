class Faculty < ActiveRecord::Base

  has_many :groups
  has_many :departments

  validates :name, :presence => true, :uniqueness => { :case_sensitive => false }

end
