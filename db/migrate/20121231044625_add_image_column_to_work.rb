class AddImageColumnToWork < ActiveRecord::Migration
  def change
  	add_column :works, :image_file_name, :string
    add_column :works, :image_content_type, :string
    add_column :works, :image_file_size, :integer
    add_column :works, :image_updated_at, :datetime
  end
end
