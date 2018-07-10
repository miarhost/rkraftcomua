class Post < ApplicationRecord

validates :title, presence: true, length: { minimum: 2, maximum: 150 }
validates :body, presence: true, length: { minimum: 2 }

mount_uploader :image, ImageUploader

end
