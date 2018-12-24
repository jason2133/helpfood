class Board < ApplicationRecord
  belongs_to :user
  def self.search(search)
    where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
  end

end
