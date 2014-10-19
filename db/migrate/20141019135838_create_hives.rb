class CreateHives < ActiveRecord::Migration
  def change
    create_table :hives do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
