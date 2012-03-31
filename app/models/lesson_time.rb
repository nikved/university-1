class LessonTime

  include Comparable
  include ActiveRecord::Validations

  validates_inclusion_of :hour, :in => (0..23)
  validates_inclusion_of :minute, :in => (0..59)

  attr_accessor :hour, :minute

  def initialize(hour, minute)
    self.hour = hour.to_i
    self.minute = minute.to_i
  end

  def <=>(other)
    hcmp = hour <=> other.hour
    mcmp = minute <=> other.minute

    hcmp == 0 ? mcmp : hcmp
  end

  def to_s
    "#{'%0.2d' % hour}:#{'%0.2d' % minute}"
  end

  def inspect
    "#<LessonTime hour: #{hour}, minute: #{minute}>"
  end

end