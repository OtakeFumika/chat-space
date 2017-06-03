class AddImageToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image, :text,null: false
  end
end
