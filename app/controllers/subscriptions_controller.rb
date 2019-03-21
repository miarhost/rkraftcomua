class SubscriptionsController < ApplicationController

	skip_before_action :verify_authenticity_token

  def create
	  @subscription = Subscription.new(subscription_params)
    if @subscription.save 
      flash[:success] = "You got a subscription"
      SubscriptionMailer.subscribe(subscription_params[:email]).deliver_later
      redirect_to home_path 
    end
  end

  def show
    @subscription = Subscription.find([:id])
  end

  private

  def subscription_params
  	 params.require(:subscription).permit(:email)
  end
end
