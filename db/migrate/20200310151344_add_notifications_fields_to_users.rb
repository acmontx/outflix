class AddNotificationsFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :frequency, :string
    add_column :users, :medium, :string
    add_column :users, :notification_size, :string
  end
end

