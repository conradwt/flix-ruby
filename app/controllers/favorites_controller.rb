class FavoritesController < ApplicationController
  before_action :require_signin
  before_action :set_movie, only: %i[create destroy]

  def create
    @movie.favorites.create!(user: current_user)

    # or append to the through association
    # @movie.fans << current_user

    redirect_to @movie
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy

    redirect_to @movie

    #
    # or
    #

    # favorite = current_user.favorites.find(id: params[:id], movie_id: params[:movie_id])

    # redirect_to favorite.movie
  end

  private

  def set_movie
    @movie = Movie.find_by!(slug: params[:movie_id])
  end
end
