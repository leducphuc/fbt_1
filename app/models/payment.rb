class Payment < ApplicationRecord
  belongs_to :booking, optional: true
  belongs_to :bank_account, optional: true

  enum classify: [:normal, :daily]

  def paypal_url return_path
    values = {
      business: "vuhuutuan262-buyer@gmail.com",
      return: "https://gentle-reaches-64346.herokuapp.com/#{return_path}",
      notify_url: "https://gentle-reaches-64346.herokuapp.com/update",
      invoice: id,
      cmd: "_xclick",
      amount: amount,
    }
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" +
      values.to_query
  end
end
