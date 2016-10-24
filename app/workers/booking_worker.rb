class BookingWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform booking_id
    booking = Booking.find_by id: booking_id
    BookingMailer.booking_email(booking).deliver_now
  end
end
