class CreateQnaComments < ActiveRecord::Migration
  def change
    create_table :qna_comments do |t|
      t.integer :qna_post_id
      t.integer :user_id
      t.text :content
      t.boolean :secret
      
      t.timestamps null: false
    end
  end
end
