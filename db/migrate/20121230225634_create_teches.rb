class CreateTeches < ActiveRecord::Migration
  def change
    create_table :teches do |t|
      t.string :title
      t.string :link

      t.timestamps
    end
  end
end
