require 'active_merchant'

ActiveMerchant::Billing::Base.mode = :test

gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
   :login => 'BuySomething',
   :password => 'SellSomething'
	)

amount  = 100

credit_card = ActiveMerchant::Billing::CreditCard.new(
	:first_name => 'Test',
	:last_name => 'Customer',
	:number => '5624213125424445',
	:month => '5',
	:year => Time.now.year+1,
	:verification_value => '000'
	)

if credit_card.validate.empty?
	responce = gateway.purchase(amount.credit_card)

 if responce.success? 
 	puts "Successfully charged $#{sprintf("%.2f", amount / 100)} to the credit card #{credit_card.display_number}"
 else
    raise StandardError, responce.message
 end
 
end
