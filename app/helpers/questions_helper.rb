module QuestionsHelper

  def add_hashtags_to_text(text)
    text.gsub( /#[\wа-я]{1,30}/i) { |word| if word.delete("#") =~ (/\A\w{4,30}\z/i); word else link_to word, "/hashtags/show/#{word.delete("#")}" end}.html_safe
    #заменяет все валидные (по правилам модели hashtag) хештеги в тексте на ссылки.
  end
end
