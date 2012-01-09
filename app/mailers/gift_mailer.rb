class GiftMailer < ActionMailer::Base
  default from: "develm2@gmail.com"

  def send_gift(email)
    mail(:to => email, :subject => "Test send")
  end
end
