# model for a hashtag word (contained in questions and answers)
class Hashtag < ApplicationRecord
  has_and_belongs_to_many :questions, dependent: :destroy

  validates :name, uniqueness: true
  validates_format_of :name, with: /\A[A-Za-zА-Яа-я_]{1,30}\z/i
end
