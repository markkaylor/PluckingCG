class ChargesController < ApplicationController
  def free
    course = Course.find(params[:course_id])
    current_user.subscriptions.create(course: course)

    redirect_to course
  end
end
