class BookingMailer < ApplicationMailer
  def user_booking_email_accepted booking
    @user = booking.user
    @booking = booking
    mail to: @user.email, subject: t("email_subject.accepted")
  end


  def user_booking_email_ignored booking
    @user = booking.user
    @booking = booking
    mail to: @user.email, subject: t("email_subject.ignored")
  end

  def user_booking_email_pending booking
    @user = booking.user
    @booking = booking
    mail to: @user.email, subject: t("email_subject.pending")
  end

  def admin_email_pending booking
    @user = User.second
    @booking = booking
    mail to: @user.email, subject: t("email_subject.admin")
  end

end
