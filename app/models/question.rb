# :nodoc:
class Question < ApplicationRecord
  attr_accessor :namee #-invisible Captcha settings

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_and_belongs_to_many :hashtags, dependent: :destroy

  validates :text, :user, presence: true
  validates_length_of :text, minimum: 1, maximum: 255

  before_save :create_question_hashtags

  def create_question_hashtags
    hashtags.clear

    hashed_words = convert_words_into_hashtags

    hashed_words.each do |word|
      hashtags << Hashtag.find_or_create_by(name: word.delete('[]#""'))
    end
  end

  def convert_words_into_hashtags
    hashed_words = []

    text_array = text.split
    text_array += answer.split if answer

    text_array.each do |word|
      hashed_words << word.delete('#') if word =~ /\A#[\p{L}_]{1,30}\Z/
    end

    hashed_words.flatten
  end
end
