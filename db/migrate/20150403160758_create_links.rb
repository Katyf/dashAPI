class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :links, :users
  end
end
