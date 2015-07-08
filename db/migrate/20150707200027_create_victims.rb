class CreateVictims < ActiveRecord::Migration
  def change
    create_table :victims do |t|
      t.string :name
      t.string :email
      t.integer :rank
      t.string :avatar_thumb
      t.string :avatar

      t.timestamps null: false
    end
  end
end
