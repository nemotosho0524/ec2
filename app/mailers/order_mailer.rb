class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_when_create.subject
  #
  def order_when_create(user)
    @user = user
    mail to: user.email,
         subject: "ご注文ありがとうございます。"
  end

  def send_admin
    user = User.find_by(admin_flg: true)
  		mail to: user.email,
  		subject: "注文が入りました。"
  end
end
