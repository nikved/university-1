class Lesson < ActiveRecord::Base

  belongs_to :day
  belongs_to :teacher, :class_name => 'AdminUser'

  validates_presence_of :day, :teacher, :time, :room, :name

  def strftime
    time.strftime('%H:%M')
  end

end
