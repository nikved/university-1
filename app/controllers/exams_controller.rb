class ExamsController < InheritedResources::Base

  respond_to :html, :json
  helper_method :search
  
  protected
  
  def collection
    @exams ||= search.relation
  end
  
  def search
    @search ||= Exam.search(params[:search])
  end


end
