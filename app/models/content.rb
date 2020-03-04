class Content < ApplicationRecord
  has_many :users, through: :user_contents

  serialize :titles_api_result, JSON
  serialize :expiring_api_result, JSON
  serialize :countries_api_result, JSON
end
