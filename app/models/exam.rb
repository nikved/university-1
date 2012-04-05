class Exam < ActiveRecord::Base

  belongs_to :lesson
  belongs_to :teacher, :class_name => 'AdminUser'

  validates_presence_of :lesson, :teacher, :time, :room
  validates_presence_of :room

end
