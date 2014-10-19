class SorceryUserActivation < ActiveRecord::Migration
  def change
    add_column :bees, :activation_state, :string, :default => nil
    add_column :bees, :activation_token, :string, :default => nil
    add_column :bees, :activation_token_expires_at, :datetime, :default => nil

    add_index :bees, :activation_token
  end
end