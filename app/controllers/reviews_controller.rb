class ReviewsController < ApplicationController
  before_action :require_signin
  before_action :set_movie

  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
  end

  def create
    @review = @movie.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to movie_reviews_url(@movie), notice: 'Thanks for your review!'
    else
      render :new
    end
  end

  def edit
    @review = @movie.reviews.find_by(id: params[:id])
  end

  def update
    @review = @movie.reviews.find_by(id: params[:id])

    if @review&.update(review_params)
      redirect_to movie_reviews_url(@movie), notice: 'Thanks for updating your review!'
    else
      render :edit
    end
  end

  def destroy
    @review = @movie.reviews.find_by(id: params[:id])

    if @review&.destroy
      redirect_to movie_reviews_url(@movie), notice: "Sorry to hear that you're deleting your review."
    else
      redirect_to movie_reviews_url(@movie), alert: 'There was a problem deleting your review.  Please try again.'
    end
  end

  private

  def review_params
    params.require(:review).permit(:stars, :comment)
  end

  def set_movie
    @movie = Movie.find_by!(slug: params[:movie_id])
  end
end
