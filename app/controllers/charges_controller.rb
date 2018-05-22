class ChargesController < ApplicationController
  def free
    course = Course.find(params[:course_id])
    current_user.subscriptions.create(course: course)

    redirect_to course
  end

  def pay
  course = Course.find(params[:course_id])

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => course.price_in_cents,
    :description => course.name,
    :currency    => 'usd'
  )

  if charge
    current_user.subscriptions.create(course: course)
    redirect_to course
  end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to course
  end
end

