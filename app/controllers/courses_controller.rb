class CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:list]

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

  def list
    if !current_user.nil?
      @courses = current_user.courses
    end
  end
end
