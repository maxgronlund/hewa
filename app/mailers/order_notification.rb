# encoding: utf-8

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
    @greeting = "#{cart.user.name} <#{cart.user.email}> har oprettet en ordre"

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
    @greeting = "Din ordrer #{cart.order_number} er blevet modtaget"
    # !!! TODO shipment etc

    mail to: cart.user.email, :subject => "Ordre bekræftigelse for din Hewa order no #{order.order_number}"
  end
end
