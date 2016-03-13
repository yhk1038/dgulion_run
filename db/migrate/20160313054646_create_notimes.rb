class CreateNotimes < ActiveRecord::Migration
  def change
    create_table :notimes do |t|
      t.integer :ltime_id
      t.timestamps null: false
    end
  end
end
