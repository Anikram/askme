class Hashtag < ApplicationRecord
  has_and_belongs_to_many :questions, dependences: :destroy

  validates :name, uniqueness: true

  validates_format_of :name, with: /\A[\d\wа-я]{1,30}\z/
end
