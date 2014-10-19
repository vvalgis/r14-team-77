class AddNameToBees < ActiveRecord::Migration
  def change
    add_column :bees, :name, :string
  end
end
