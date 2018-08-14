# connecting table for many-to-many connection of Question and Hashtag
class QuestionHashtag < ApplicationRecord
  belongs_to :question
  belongs_to :hashtag
end
