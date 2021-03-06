class AddImageColumnToTeches < ActiveRecord::Migration
  def change
	add_column :teches, :image, :string
    add_column :teches, :image_file_name, :string
    add_column :teches, :image_content_type, :string
    add_column :teches, :image_file_size, :integer
    add_column :teches, :image_updated_at, :datetime
  end
end
