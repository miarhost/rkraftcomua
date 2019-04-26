class OrderMailer < ApplicationMailer
  default from: "rghostme@gmail.com"
  def received(order)
    @order = order
    mail to: order.email, subject: t('.subject')
  end

  def shipped(order)
    @order = order
    mail to: order.email, subject: 'Your order is shipped. Please confirm the reception'
  end
end
