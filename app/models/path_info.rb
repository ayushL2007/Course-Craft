class PathInfo < ApplicationRecord
  belongs_to :path
  has_many :roadmaps
end
