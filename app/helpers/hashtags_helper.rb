module HashtagsHelper
  def hashtag_path(hashtag)
    "hashtags/show/#{hashtag}".html_safe
  end
end
