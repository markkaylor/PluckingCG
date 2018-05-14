class LessonController < ApplicationController
  def show
    @course = Course.find(params[:course_id])
    @lessons = @course.lessons
    @lesson = @lessons.find(params[:id])
  end

  def should_generate_new_friendly_id?
    title_changed?
  end
end
