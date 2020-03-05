class AddRatingToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :netflix_rating, :float
  end
end
