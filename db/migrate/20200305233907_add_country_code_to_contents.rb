class AddCountryCodeToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :country_code, :string
    add_index :contents, [:country_code, :netflix_id], unique: true
  end
end
