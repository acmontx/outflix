class AddNetflixIdToContents < ActiveRecord::Migration[5.2]
  def change
    add_index :contents, :netflix_id
  end
end
