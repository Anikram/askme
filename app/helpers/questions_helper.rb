# :nodoc:
module QuestionsHelper
  def add_hashtags_to_text(hashwords, text)
    hashwords.each do |hashword|
      text.gsub!(/##{hashword}/) { link_to }
    end
    text
  end
end
