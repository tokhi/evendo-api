class AddThumbnailToEvents < ActiveRecord::Migration
  def change
    add_column :events, :thumbnail, :string
  end
end
