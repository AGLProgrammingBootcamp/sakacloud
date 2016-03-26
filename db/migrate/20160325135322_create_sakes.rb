class CreateSakes < ActiveRecord::Migration
  def change
    create_table :sakes do |t|
      t.string :name
      t.string :place
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
