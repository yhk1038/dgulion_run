class CreateQnaPosts < ActiveRecord::Migration
  def change
    create_table :qna_posts do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.boolean :secret
      
      t.timestamps null: false
    end
  end
end
