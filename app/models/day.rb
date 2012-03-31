class Day < ActiveRecord::Base

  DAYNAMES = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

  belongs_to :schedule
  has_many :lessons

  default_scope includes(:lessons)

  validates_inclusion_of :name, :in => DAYNAMES


end
