class Content < ApplicationRecord
  has_many :users, through: :user_contents

  # serialize :details, JSON
  # serialize :cast, Array
end
