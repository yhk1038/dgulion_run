class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      
      t.string :user_name
      t.string :user_major
      t.string :user_email
      t.string :user_phone
      t.text   :user_message

      t.timestamps null: false
    end
  end
end
