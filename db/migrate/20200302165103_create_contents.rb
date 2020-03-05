class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :category
      t.string :genre
      t.string :netflix_id
      t.string :image_url
      t.string :plot
      t.date :expiration_date

      t.timestamps
    end
  end
end
