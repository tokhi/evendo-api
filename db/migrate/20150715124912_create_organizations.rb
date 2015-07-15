class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :address
      t.string :telephone
      t.string :email

      t.timestamps null: false
    end
  end
end
