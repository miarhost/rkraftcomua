class ImagesController < ApplicationController

	before_action :set_inquiry, only: [:create]
  
  def index
  @images = Image.all
  end
  
  def create
  	add_images(images_params[:images])
  	flash[:error] = "Images' upload failed" unless @inquiry.save
  	redirect_to :back
  end

  private

  def set_inquiry
  	@inquiry = Inquiry.find(params[:inquiry_id])
  end 

  def add_images(new_images)
  	images = @inquiry.images
  	images += new_images 
  	@inquiry.assign_attributes images: images 
  end
  
 
  def images_params
  	params.require(:inquiry).permit({images: []})
  end

end
