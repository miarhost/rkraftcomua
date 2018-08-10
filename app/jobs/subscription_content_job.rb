class SubscriptionContentJob < ApplicationJob
self.queue_adapter = :sidekiq
  queue_as :low_priority
 sidekiq_options retry: 5
 around_perform :around_delivering

  def perform(subscription_mailer)
  	subscription_mailer = ActionMailer::SubscriptionMailer.notify(@post)
    
  	rescue ActiveRecord::RecordNotFound
     
  end 

  private

  def around_delivering(job)
   attempt_retry { :trace => ENV["S3_BUCKET"] } 
  end

end

