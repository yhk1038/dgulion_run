class CreateLUsers < ActiveRecord::Migration
  def change
    create_table :l_users do |t|
      t.string :name
      t.string :password
      t.integer :time1, default: 0
      t.integer :time2, default: 0
      t.integer :time3, default: 0
      t.timestamps null: false
    end
  end
end
