class Question < ApplicationRecord

  attr_accessor :namee #-invisible Captcha settings

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_and_belongs_to_many :hashtags

  validates :text, :user, presence: true
  validates_length_of :text, :minimum => 1, :maximum => 255 #49-1 text length validation

end
