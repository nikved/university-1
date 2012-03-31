class SchedulesController < InheritedResources::Base

  respond_to :html, :json

  def index
    @search = Schedule.search(params[:search])
    @schedules = @search.relation
    index!
  end

end
