class CreateStates < ActiveRecord::Migration[4.2]
  def change
    create_table :states do |t|
      t.string :name, null: false
      t.string :code, null: false

      t.timestamps
    end
		add_index :states, :name, unique: true
		add_index :states, :code, unique: true
  end
end
