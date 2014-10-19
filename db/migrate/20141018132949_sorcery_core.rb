class SorceryCore < ActiveRecord::Migration
  def change
    create_table :bees do |t|
      t.string :email
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end

  end
end