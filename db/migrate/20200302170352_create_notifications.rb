class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.text :message
      t.datetime :date_sent
      t.boolean :read
      t.string :medium
      t.references :user_content, foreign_key: true

      t.timestamps
    end
  end
end
