class SchedulesController < InheritedResources::Base

  respond_to :html, :json
  helper_method :search

  protected

  def collection
    @schedules ||= search.relation
  end

  def search
    @search ||= Schedule.search(params[:search])
  end

end
