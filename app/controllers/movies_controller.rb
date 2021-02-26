class MoviesController < ApplicationController
  before_action :require_signin, except: %i[index show]
  before_action :require_admin, except: %i[index show]
  before_action :set_movie, only: %i[show edit update destroy]

  def index
    @movies = Movie.send(movies_filter)
  end

  def show
    @fans = @movie.fans
    @genres = @movie.genres.order(:name)

    @favorite = current_user.favorites.find_by(movie_id: @movie.id) if current_user
  end

  def edit; end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'Movie successfully updated!'
    else
      render :edit
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie, notice: 'Movie successfully created!'
    else
      render :new
    end
  end

  def destroy
    if @movie.destroy
      redirect_to movies_path, alert: 'Movie successfully deleted!'
    else
      redirect_to :show
    end
  end

  private

  def set_movie
    @movie = Movie.find_by!(slug: params[:id])
  end

  def movies_filter
    if params[:filter].in? %w[upcoming recent hits flops]
      params[:filter]
    else
      :released
    end
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :rating,
                                  :released_on, :total_gross, :director,
                                  :duration, :main_image, genre_ids: [])
  end
end
