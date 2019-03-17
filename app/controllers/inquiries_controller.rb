class InquiriesController < ApplicationController

  def index
    @inquiries = Inquiry.all
  end	

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params) 
    if @inquiry.save
      flash[:success] = "Your inquiry is sent"
      InquiryMailer.reply(@inquiry).deliver_later
      redirect_to home_path
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:email, :first_name, :second_name, :subject, :message, :image, :image_cache)
  end
end
