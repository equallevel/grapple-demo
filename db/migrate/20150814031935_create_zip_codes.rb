class CreateZipCodes < ActiveRecord::Migration[4.2]
  def change
    create_table :zip_codes do |t|
      t.string :zip, null: false
      t.string :city
      t.string :county
      t.integer :state_id, null: false
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
		add_index :zip_codes, :zip, unique: true
  end
end
