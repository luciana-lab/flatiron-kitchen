class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end
    
    def new
        @recipe = Recipe.new
        # 4.times { @recipe.ingredients.build }
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to @recipe
        else
            render 'new'
        end
    end

    def show
        find_by_recipe
    end

    def edit
        find_by_recipe
    end

    def update
        find_by_recipe
        if @recipe.update(recipe_params)
            redirect_to @recipe
        else
            render 'edit'
        end
    end

    private
    def find_by_recipe
        @recipe = Recipe.find_by_id(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end
end