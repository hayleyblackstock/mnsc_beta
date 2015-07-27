class RecipesController < ApplicationController
  before_action :authenticate

  def index
      @recipes = Recipe.all
    end

def new
  @recipe = Recipe.new
end

def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipes_path
    else
      render 'new'
    end
end

def edit
  @recipe = Recipe.find(params[:id])
end

def update

end

def show
  @recipe = Recipe.find(params[:id])
end

def destroy
  @recipe = Recipe.find(params[:id])
  @recipe.destroy
  redirect_to recipes_path, notice: "Recipe was deleted!"

end


private

def recipe_params
  params.require(:recipe).permit(:name, :type, :user_id, :url)
end

end
