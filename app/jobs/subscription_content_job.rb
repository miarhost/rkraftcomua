class SubscriptionContentJob < ApplicationJob
  self.queue_adapter = :sidekiq
  queue_as :low_priority

  def perform(image)
  	 ActionMailer::SubscriptionMailer.notify(@post)
    if Rails.env.production? 
      image = @post.image 
      image.enqueue wait: 24.minutes 
    end
  end 
end

