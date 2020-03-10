class AddFrequencyToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :frequency, :string
  end
end
