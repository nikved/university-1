class Lesson < ActiveRecord::Base

  belongs_to :day

  def strftime
    time.strftime('%H:%M')
  end

end
