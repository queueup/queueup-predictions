# frozen_string_literal: true

module AvatarHelper
  def avatar_url(email, size = 50)
    email_digest = Digest::MD5.hexdigest(email)
    "https://www.gravatar.com/avatar/#{email_digest}?d=identicon&s=#{size}"
  end
end
