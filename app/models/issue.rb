class Issue < ApplicationRecord
  belongs_to :product
  has_many :tasks, dependent: :destroy
  validates :summary, presence: true
end
