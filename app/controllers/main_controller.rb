class MainController < ApplicationController

  def self.google_map(center)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=500x500&zoom=17"
    end

  def home
    @subscription = Subscription.new
  end

  def catalog
    @products = Product.all
  end

  def services
  end

  def contacts
    @inquiry = Inquiry.new
    @inquiry.images = @images

  end

  def gallery
    @images = Image.paginate(:page => params[:page], :per_page => 15)
  end
  
end
