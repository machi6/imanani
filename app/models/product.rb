class Product < ApplicationRecord
  belongs_to :user
  has_many :issues, dependent: :destroy
  validates :name, presence: true
end
