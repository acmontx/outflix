class CreateNetflixApiCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :netflix_api_calls do |t|
      t.jsonb :body
      t.string :query
      t.index [:query], unique: true

      t.timestamps
    end
  end
end
