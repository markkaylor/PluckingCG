class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @lessons = @course.lessons

    @joined = false

    if !current_user.nil? && !current_user.courses.nil?
      @joined = current_user.courses.include?(@course)
    end
  end
end
