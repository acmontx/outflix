require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "expiring" do
    mail = UserMailer.expiring
    assert_equal "Expiring", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
