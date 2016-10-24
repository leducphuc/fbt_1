class BookingMailer < ApplicationMailer
  def booking_email booking
    binding.pry
    @user = booking.user
    @booking = booking
    mail to: @user.email, subject:"hai con than lan con"
  end
end
