require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "welcome" do
    mail = UserMailer.welcome
    assert_equal "Welcome", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  def message
    mail(
      :subject => 'Hello from Postmark',
      :to  => 'mark@pluckingclassicalguitar.com',
      :from => 'mark@pluckingclassicalguitar.com',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end

end
