module UsersHelper
  def profile_image(user, size = 100)
    url = "https://secure.gravatar.com/avatar/#{user.gravatar_id}?s=#{size}&d=robohash"
    image_tag(url, alt: user.name, class: 'rounded-circle z-depth-2', 'data-holder-rendered': 'true')
  end
end
