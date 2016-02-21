class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      
      t.string  :desc_short
      t.text    :logo_url
      t.string  :name
      t.string  :link_url
      t.text    :desc_long
      t.boolean :is_live

      t.timestamps null: false
    end
  end
end
