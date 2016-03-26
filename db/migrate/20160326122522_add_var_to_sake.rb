class AddVarToSake < ActiveRecord::Migration
  def change
    add_column :sakes, :brewery, :string
    add_column :sakes, :kind, :string
    add_column :sakes, :alcohol, :float
    add_column :sakes, :nihonsyudo, :integer
    add_column :sakes, :koujimai, :string
    add_column :sakes, :kakemai, :string
    add_column :sakes, :acid, :integer
    add_column :sakes, :amino, :integer
  end
end
