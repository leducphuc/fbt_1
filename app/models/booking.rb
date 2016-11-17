class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  belongs_to :discount

  has_one :payment
  has_many :activities, as: :activable, dependent: :destroy

  enum status: [:init, :pending, :accepted, :ignored, :canceled]

  before_create :apply_discount

  validate :start_date_validate, on: :create

  private
  def apply_discount
      if tour.discount && tour.discount.happening?
        self.total_price = tour.price - tour.price * discount.percent/100
        self.discount_id = discount.id
      else
        self.total_price = tour.price
      end
  end

  def start_date_validate
    if start_date.nil?
      errors.add :start_date, "Startdate not presence"
    elsif start_date < Date.current
      errors.add :start_date, I18n.t("model_validate.start_date")
    end
  end
end
