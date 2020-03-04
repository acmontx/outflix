class AddApiResultsToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :titles_api_result, :jsonb
    add_column :contents, :expiring_api_result, :jsonb
    add_column :contents, :countries_api_result, :jsonb
  end
end
