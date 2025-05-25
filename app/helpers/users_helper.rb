module UsersHelper
  def profile_image(user, options = {})
    # Extract Gravatar 's' parameter size from options, defaulting to 100.
    # This allows calls like profile_image(user, gravatar_size: 128, class: "w-32 h-32...")
    # It also supports :size for backward compatibility if other parts of the app used it for Gravatar.
    gravatar_fetch_size = options.delete(:gravatar_size) || options.delete(:size) || 100

    # Default :alt text if not provided in options.
    options[:alt] ||= user.name

    url = "https://secure.gravatar.com/avatar/#{user.gravatar_id}?s=#{gravatar_fetch_size}&d=robohash"
    # Pass the remaining options (which now includes :class and :alt) to image_tag.
    image_tag(url, options)
  end
end
