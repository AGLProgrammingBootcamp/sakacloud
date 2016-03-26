class AddImageToSakes < ActiveRecord::Migration
  def change
    add_column :sakes, :image, :string
  end
end
