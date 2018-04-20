class Question < ApplicationRecord

  belongs_to :user

  validates :text, :user, presence: true
  validates_length_of :text, :minimum => 1, :maximum => 255 #49-1 text length validation

end
