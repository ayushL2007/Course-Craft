class Path < ApplicationRecord
  validates :title, :description, presence: :true

  has_one :path_info
  has_many :roadmaps, through: :path_info

  belongs_to :user
end
