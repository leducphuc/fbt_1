class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  belongs_to :discount

  has_one :payment
  has_many :activities, as: :activable, dependent: :destroy

  enum status: [:init, :pending, :accepted, :ignored, :canceled]

  before_create :apply_discount, unless: :discount
  after_commit :send_booking_email, on: :create

  validate :start_date_validate, on: :update

  private
  def apply_discount
    unless discount && total_price
      if tour.discount && tour.discount.active?
        discount = tour.discount
        total_price = tour.price - tour.price * discount
        discount_id = discount.id
      else
        total_price = tour.price
      end
    end
  end

  def start_date_validate
    if start_date < Date.current
      errors.add :start_date, I18n.t("model_validate.start_date")
    end
  end

  def send_booking_email
    BookingWorker.perform_async self.id
    if pending?
      #do pending
    elsif accepted?
      #do accepted
    elsif canceled
      #do canceled
    end
  end
end
