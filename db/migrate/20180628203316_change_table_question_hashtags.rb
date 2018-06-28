class ChangeTableQuestionHashtags < ActiveRecord::Migration[5.1]
  def change
    rename_table :question_hashtags, :hashtags_questions
  end
end
