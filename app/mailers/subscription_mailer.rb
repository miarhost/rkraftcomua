class SubscriptionMailer < ApplicationMailer
	 default from: "rghostme@gmail.com"

	 def subscribe(email_address)
	   @email_address = email_address
	   mail(to: email_address, subject: "You got a subscription")
  end 

  def notify(post)
    @post = post 
    @emails = Subscription.all.map{|i| i.email}
    @emails.map!{|email| mail(to: email, subject: "New blog post is coming out!")}
  end
end
