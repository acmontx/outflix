class Content < ApplicationRecord
  has_many :users, through: :user_contents
end
