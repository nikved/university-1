class Schedule < ActiveRecord::Base

  JSON_SCHEMA = {
      :methods => :name,
      :only => :id,
      :include => {
          :days => {
              :only => 'name',
              :include => {
                  :lessons => {
                      :only => [:lecture, :room],
                      :methods => :strftime
                  }
              }
          }
      }
  }

  belongs_to :group
  has_many :days, :dependent => :destroy

  after_create { Day::DAYNAMES.each { |name| self.days.create :name => name } }

  default_scope includes(:days, :group)

  def name
    "#{group.name} Schedule"
  end

  def to_json(*)
    super JSON_SCHEMA
  end

end
