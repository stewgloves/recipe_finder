module ApplicationHelper
  include Pagy::Frontend

  def star_rating(rating, max_stars = 5)
    full_star = '<i class="fas fa-star"></i>'
    half_star = '<i class="fas fa-star-half-alt"></i>'
    empty_star = '<i class="far fa-star"></i>'
    full_stars = full_star * rating.floor
    half_star = (rating % 1 >= 0.5) ? half_star : ""
    empty_stars = empty_star * (max_stars - rating.ceil)
    (full_stars + half_star + empty_stars).html_safe
  end
end
