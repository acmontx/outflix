class UserContent < ApplicationRecord
  belongs_to :user
  belongs_to :content
  has_many :notifications
end
