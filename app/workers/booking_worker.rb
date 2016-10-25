class BookingWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform booking_id
    booking = Booking.find_by id: booking_id
    status = booking.status
    user_mailer = "user_booking_email_" << status.to_s
    BookingMailer.send(user_mailer, booking).deliver_now
    if status == "pending"
      admin_mailer = "admin_email_pending"
      BookingMailer.send(admin_mailer, booking).deliver_now
    end
  end
end
