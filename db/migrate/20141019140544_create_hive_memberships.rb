class CreateHiveMemberships < ActiveRecord::Migration
  def change
    create_table :hive_memberships do |t|
      t.references :hive, index: true
      t.references :bee, index: true
      t.boolean :is_owner

      t.timestamps
    end
  end
end
