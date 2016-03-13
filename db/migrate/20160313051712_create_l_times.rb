class CreateLTimes < ActiveRecord::Migration
  def change
    create_table :l_times do |t|
      t.string :name, default: ""
      t.integer :time1, default: 0
      t.integer :time2, default: 0
      t.integer :time3, default: 0
      t.integer :time4, default: 0
      t.timestamps null: false
    end
  end
end

