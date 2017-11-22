require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "order_when_create" do
    mail = OrderMailer.order_when_create
    assert_equal "Order when create", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
