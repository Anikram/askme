module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.png'
    end
  end

  def decline_word (number, krokodil, krokodila, krokodilov) #lesson50 - decline method for question counter
    if (number == nil || !number.is_a?(Numeric))
      number = 0
    end

    remainder = number % 100

    if (remainder >= 11 && remainder <= 20)
      return krokodilov
    end

    remainder = number % 10

    if (remainder == 1)
      return  krokodil
    elsif (remainder >= 2 && remainder <= 4)
      return  krokodila
    else
      return krokodilov
    end
  end
end
