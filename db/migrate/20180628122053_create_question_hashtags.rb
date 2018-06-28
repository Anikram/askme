class CreateQuestionHashtags < ActiveRecord::Migration[5.1]
  def change
    create_table :question_hashtags do |t|
      t.references :question, index: true, foreign_key: true
      t.references :hashtag, index:true,  foreign_key: true

      t.timestamps
    end
  end
end
