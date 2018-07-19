class Question < ApplicationRecord

  attr_accessor :namee #-invisible Captcha settings

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_and_belongs_to_many :hashtags, dependent: :destroy

  validates :text, :user, presence: true
  validates_length_of :text, :minimum => 1, :maximum => 255 #49-1 text length validation

  before_save :create_question_hashtags


  def create_question_hashtags
    self.hashtags.clear

    hashed_words = get_hash_words_from_text

    hashed_words.each do |word|
      self.hashtags << Hashtag.find_or_create_by(name: word.delete('[]#""'))
    end
  end

  def get_hash_words_from_text
    hashed_words = []

    text_array = self.text.split

    text_array.each do |word|
      hashed_words << word if (word =~ /#/) == 0
    end

    unless self.answer.nil?
      answer_array = self.answer.split

      answer_array.uniq.each do |word|
        hashed_words << word if (word =~ /#/) == 0
      end
    end

    hashed_words
  end
end
