require 'rails_helper'

RSpec.describe Question, type: :model do
  describe '.convert_words_into_hashtags' do
    let(:question) { create(:question) }

    it 'returns array of words' do
      tags = question.convert_words_into_hashtags
      expect(tags.flatten).to eq %w[two five no shure]
    end
  end
end
