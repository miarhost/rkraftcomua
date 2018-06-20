require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase

def setup
 @subscription = Subscription.new(email: "user@example.com")
end 

test "email should not be too long" do
 @email = "a" * 244 + "@example.com"
 assert_not @subscription.valid?
end

test "emails should be unique" do
 duplicate_subscription = @subscription.dup
 duplicate_subscription.email = @subscription.email
 @subscription.save
 assert_not duplicate_subscription.valid?
end

test "should reject invalid email addresses" do
 invalid_addresses = %w[user@example,com user_at_foo_org user.name@example. foo@bar_baz.com foo@bar+baz.com]
  invalid_addresses.each do |invalid_address|
  	@subscription.email = invalid_address
    assert_not subscription.valid?, "Address #{invalid_address.inspect} is invalid!"
  end
end

end