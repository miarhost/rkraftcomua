class Inquiry < ApplicationRecord
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, 
	 length: { minimum: 12, maximum: 255 },
          format: {with: VALID_EMAIL_REGEX }
    validates :message,
          presence: :true      
    mount_uploader :image, ImageUploader  

    serialize :images  

end
