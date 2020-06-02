class Api::V1::RecipesController < ApplicationController
  def index
    recipe = Recipe.all.order(created_at: :desc)
    render json: recipe
  end

  def create
    recipe = Recipe.create!(recipe_params)

    if recipe
      render json: recipe
    else
      render json: recipe.errors
    end
  end

  def show
    if recipe
      render json: recipe
    else
      render json: recipe.errors
    end
  end

  def destroy
    recipe&.destroy
    render json: { message: 'Recipe deleted!' }
  end

  def update
    recipe = Recipe.find(params[:id])
    
    recipe.update!(recipe_params)

    if recipe
      render json: recipe
    else
      render json: recipe.errors
    end
  end

  private
   
  def recipe_params
    params.permit(:name, :ingredients, :instruction, :image)
  end

  def recipe
    @recipe ||= Recipe.find(params[:id])
  end
end
