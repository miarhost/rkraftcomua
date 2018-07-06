class AddImageToInquiries < ActiveRecord::Migration[5.1]
 
 def change
  add_column :inquiries, :image, :string 
 end

end