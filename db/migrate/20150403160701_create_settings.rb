class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :location

      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :settings, :users
  end
end
