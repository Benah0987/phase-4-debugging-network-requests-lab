class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toy
    .create(toy_params)
    render json: toy, status: :created
  end

 
  def update
    # Find the toy by id
    toy = Toy.find_by(id: params[:id])
  
    # Check if toy.likes is nil
    if toy.likes.nil?
      likes = 1 # If nil, set likes to 1
    else
      likes = toy.likes + 1 # If not nil, increment likes by 1
    end
  
    # Attempt to update the toy with the incremented likes
    if toy.update(toy_params.merge(likes: likes))
      render json: toy # Return the updated toy as JSON response
    else
      render json: { error: "Failed to update toy" }, status: :unprocessable_entity
    end
  end
  
  
  
  

  def destroy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    head :no_content
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

end
