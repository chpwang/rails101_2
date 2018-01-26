class Group < ApplicationRecord
  validates :title, presence: true

  has_many :posts
  
  belongs_to :user
end
