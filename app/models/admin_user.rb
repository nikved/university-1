class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  
  DEFAULT_PASSWORD = 'pa$$w0rd'

  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me

  after_create { |admin| admin.send_reset_password_instructions }
  before_validation :setup_password, :on => :create

  validates :name, :presence => true, :uniqueness => true

  private

  def setup_password
  	 self.password = DEFAULT_PASSWORD
  end

end
