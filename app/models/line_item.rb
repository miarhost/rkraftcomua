class LineItem < ApplicationRecord
	belongs_to :order, optional: true 
  belongs_to :product, optional: true
  belongs_to :cart

  def total_price
  	if I18n.locale == :en
  	product.price * quantity 
    else
    product.price_ru * quantity
    end
  end
  
end
