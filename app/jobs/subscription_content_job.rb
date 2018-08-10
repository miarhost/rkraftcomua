class SubscriptionContentJob < ApplicationJob
self.queue_adapter = :sidekiq
  queue_as :low_priority
 
 around_perform :around_delivering

  def perform(subscription_mailer)
  	rescue_from(ActiveRecord::RecordNotFound) do |exception|
     raise 'no content available'
   end

  end 

  private

  def around_delivering(job)
   retry: 5
  end

end

