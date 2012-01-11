class GiftMailer < ActionMailer::Base
  def send_gift(to_email)
    mail(:to => to_email, :from => "develm2@gmail.com", :subject => "Test send")
  end
end
