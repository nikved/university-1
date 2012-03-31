class StudentsController < ApplicationController

  skip_before_filter :require_login, :only => [:new, :create]

  def new
    @student = Student.new
  end

  def show
    @student = current_user
  end

  def edit
    @student = current_user
  end

  def update
    @student = current_user
    @student.attributes = params[:student]
    if @student.save
      redirect_to @student
    else
      render :edit
    end

  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      redirect_to @student
    else
      render :new
    end
  end

end
