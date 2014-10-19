class CreateCombs < ActiveRecord::Migration
  def change
    create_table :combs do |t|
      t.string :title
      t.text :description
      t.integer :visibility, default: 0, null: false
      t.belongs_to :hive, index: true
      t.belongs_to :author, index: true

      t.timestamps

      t.index :visibility
    end
  end
end
