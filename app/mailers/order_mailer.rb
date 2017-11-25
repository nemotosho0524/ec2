class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_when_create.subject
  #
  def order_when_create(order)
    @order = order
    mail to: order.email,
         subject: "ご注文ありがとうございます。"
  end

  def send_admin(order)
    @order = order
    admin = User.find_by(admin_flg: true)
  		mail to: admin.email,
  		subject: "注文が入りました。"
  end
end
