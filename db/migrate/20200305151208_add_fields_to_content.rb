class AddFieldsToContent < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :runtime, :string
    add_column :contents, :imdb_id, :string
    add_column :contents, :imdb_rating, :float
    add_column :contents, :cast, :jsonb
    add_column :contents, :details, :jsonb
  end
end
