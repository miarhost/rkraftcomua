require 'test_helper'

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest

setup do
 @subscription = subscriptions(:one)
end

 test "should create subscription" do
 assert_difference('Subscrtiptions.count') do
 post subscriptions_url, params: { subscription: { email: @subscription.email } }
 assert_responce :success 
 end
end

end
