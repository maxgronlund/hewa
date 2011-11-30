class OrderNotification < ActionMailer::Base
  default from: "webshop@hewa.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notification.order_placed.subject
  #
  def order_placed(cart)
    @cart = cart
    @user = cart.user
    @greeting = "User #{cart.user.name} <#{cart.user.email}> has placed an order"

    mail to: "info@hewa.dk", :subject => t('mailer.order_placed.subject', user_email: cart.user.email)
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notification.order_placed_confirmation.subject
  #
  def order_placed_confirmation(cart)
    @cart = cart
    @user = cart.user
    #@greeting = "Thank you for placing an order"

    mail to: cart.user.email, :subject => t('mailer.order_placed.subject', order_no: cart.id)
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notification.order_confirmation.subject
  #
  def order_confirmation(cart)
    @greeting = "Your order #{cart.order_number} has been confirmed"
    # !!! TODO shipment etc

    mail to: cart.user.email, :subject => "Order confirmation for your Hewa order no #{order.order_number}"
  end
end
