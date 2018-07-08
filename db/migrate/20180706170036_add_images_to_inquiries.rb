class AddImagesToInquiries < ActiveRecord::Migration[5.1]

 def change
add_column :inquiries, :images, :string
 end

end 