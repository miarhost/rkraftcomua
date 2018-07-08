class Inquiry < ApplicationRecord
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, 
	 length: { minimum: 12, maximum: 255 },
          format: {with: VALID_EMAIL_REGEX }
    validates :message,
          presence: :true 
    has_many :images
    mount_uploader :images, ImageUploader     
   
    serialize :images, JSON

    accepts_nested_attributes_for :images, allow_destroy: true

end
