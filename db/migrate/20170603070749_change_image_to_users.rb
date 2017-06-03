class ChangeImageToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :image, :text
  end
end
