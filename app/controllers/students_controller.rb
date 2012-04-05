class StudentsController < InheritedResources::Base

  skip_before_filter :require_login, :only => [:new, :create]

  respond_to :html, :json

  def index
    @search = Student.search(params[:search])
    @students = @search.relation
    index!
  end

end
