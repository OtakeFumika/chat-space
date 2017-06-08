class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :text
      t.text :image
      t.integer :use_id, foreign_key: true, index: true
      t.integer :group_id, foreign_key: true, index: true
      t.timestamps
    end
  end
end
