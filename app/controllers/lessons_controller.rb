class LessonsController < ApplicationController
  def show
    course = Course.find(params[:course_id])
    @lessons = course.lessons
    @lesson = @lessons.find(params[:id])

    @next_lesson = @lesson.next
    @prev_lesson = @lesson.prev
  end
end
