class Order < ApplicationRecord
 
 has_many :line_items, dependent: :destroy
 before_save { email.downcase! }
 REGEXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	enum pay_type: {
		"Credit card" => 0,
		"Purchase order" => 1
	}

 validates :name, presence: true, length: { minimum: 3 }
 validates :address, presence: true, length: { minimum: 2, maximum: 150 }
 validates :email, presence: true, length: { minimum: 12, maximum: 255 },
                   format: { with: REGEXP }
                                    
 validates :pay_type, inclusion: pay_types.keys 

    def add_line_items_from_cart(cart)
    	cart.line_items.each do |item|
    		item.cart_id = nil
    		line_items << item
    	end
    end

end
