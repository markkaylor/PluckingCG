module ApplicationHelper

  def avatar_url(user, size)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?d=identicon&s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "circle responsive_img")
  end
end
