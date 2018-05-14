class CourseController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @lessons = @course.lessons
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
