class Task < ApplicationRecord
  belongs_to :issue
  with_options presence: true do
    validates :title, presence: true
    validates :start, presence: true
    validates :time, presence: true
  end
end
