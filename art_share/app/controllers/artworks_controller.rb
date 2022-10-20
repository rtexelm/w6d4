# app/controllers/users_controller.rb

class ArtworksController < ApplicationController

  def index

    @artworks = Artwork.artworks_for_user_id(user_id_param) 
    #User.find(user_id_param).artworks
    @shared_artworks = User.find(user_id_param).shared_artworks

    render json: @artworks + @shared_artworks
  end

  def create

    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    render json: @artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end

  private

  def user_id_param
    params[:user_id]
  end

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

end