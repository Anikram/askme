# :nodoc:
module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.png'
    end
  end
  # decline method for question counter
  def decline_word(number, krokodil, krokodila, krokodilov)
    number = 0 if number.nil? || !number.is_a?(Numeric)

    remainder = number % 100

    krokodilov if (remainder >= 11 && remainder <= 20)

    remainder = number % 10

    if remainder == 1
      krokodil
    elsif remainder >= 2 && remainder <= 4
      krokodila
    else
      krokodilov
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  def bg_color(user)
    if user.bgcolor.present?
      user.bgcolor
    else
      user.bgcolor = '#005a55'
    end
  end
end
