class Issue < ApplicationRecord
  belongs_to :product
  validates :summary, presence: true
end
