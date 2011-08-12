class OrderNotification < ActionMailer::Base
  default from: "webshop@hewa.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notification.order_placed.subject
  #
  def order_placed(cart)
    @greeting = "User #{cart.user.email} has placed an order"

    mail to: "larshoeg@gmail.com"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notification.order_placed_confirmation.subject
  #
  def order_placed_confirmation(cart)
    @greeting = "Thank you for placing an order"

    mail to: cart.user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notification.order_confirmation.subject
  #
  def order_confirmation(cart)
    @greeting = "Your order #{cart.orer_no} has been confirmed"
    # !!! TODO shipment etc

    mail to: cart.user.email
  end
end
