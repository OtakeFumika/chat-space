class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|
      t.integer :user_id, foreign_key: true, index: true
      t.integer :group_id, foreign_key: true, index: true
      t.timestamps
    end
  end
end
