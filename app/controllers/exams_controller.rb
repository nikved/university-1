class ExamsController < InheritedResources::Base

  respond_to :html, :json

  def index
    @search = Exam.search(params[:search])
    @exams = @search.relation
    index!
  end


end
