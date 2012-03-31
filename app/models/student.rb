class Student < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email, :first_name, :last_name, :username, :birthday, :group_id, :password, :password_confirmation
  #hash_keys :first_name, :last_name, :email

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates :email, :presence => true, :uniqueness => true

  belongs_to :group
  has_one :schedule, :through => :group

end
