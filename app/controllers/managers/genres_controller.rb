class Managers::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all.page(params[:page]).per(10)
  end
  
  
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to managers_genres_path
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to managers_genres_path
  end
  
  private
  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end
  
end
