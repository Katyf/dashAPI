class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :name
      t.string :category
      t.string :url
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :feeds, :users
  end
end
