class NetflixApiCall < ApplicationRecord
  validates :query, uniqueness: true

  def stale?
    old? || body.nil?
  end

  def old?
    self.updated_at < 1.week.ago
  end
end
