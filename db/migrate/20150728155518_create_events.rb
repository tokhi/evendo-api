class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :ogranization, index: true, foreign_key: true
      t.string :title
      t.date :event_date
      t.string :location
      t.integer :seat_nums
      t.string :price
      t.string :description
      t.string :custom_fields

      t.timestamps null: false
    end
  end
end
