class InquiryMailer < ApplicationMailer
  default from: "rghostme@gmail.com"
  def reply(inquiry)
    @inquiry = inquiry
    mail(to: inquiry.email, subject: "Your inquiry is sent")
  end
end
