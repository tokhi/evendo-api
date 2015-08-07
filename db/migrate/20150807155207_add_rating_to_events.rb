class AddRatingToEvents < ActiveRecord::Migration
  def change
    add_column :events, :rating, :string
  end
end
