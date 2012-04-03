class LessonsController < InheritedResources::Base
  respond_to :html, :js

  def new
  	@lesson = Lesson.new
    @days = Schedule.find(params[:schedule_id]).days
    new!
  end
end
