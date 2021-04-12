module MoviesHelper
  def average_stars_as_percent
    average_stars(self)
  end

  def average_stars(movie)
    average = movie.average_stars
    average.zero? ? 'No reviews' : number_with_precision(average, precision: 1)
  end

  def description(movie)
    truncate(movie.description, length: 40, separator: ' ')
  end

  def main_image(movie)
    if movie.main_image.attached?
      image_tag movie.main_image.variant(resize_to_limit: [150, nil])
    else
      image_tag 'placeholder.png'
    end
  end

  def nav_link_to(text, url)
    if current_page?(url)
      link_to(text, url, class: 'active')
    else
      link_to(text, url)
    end
  end

  def total_gross(movie)
    if movie.flop?
      'Flop!'
    else
      number_to_currency(movie.total_gross, precision: 0)
    end
  end

  def year_of(movie)
    movie.released_on.year
  end
end
