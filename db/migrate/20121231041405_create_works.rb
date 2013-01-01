class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title
      t.text :body
      t.string :image
      t.string :link

      t.timestamps
    end
  end
end
