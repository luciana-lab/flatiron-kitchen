class IngredientsController < ApplicationController
    def index
        @ingredients = Ingredient.all
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
            redirect_to @ingredient
        else
            render 'new'
        end
    end

    def show
        find_by_ingredident
    end

    def edit
        find_by_ingredident
    end

    def update
        find_by_ingredident
        if @ingredient.update(ingredient_params)
            redirect_to @ingredient
        else
            render 'edit'
        end
    end

    private
    def find_by_ingredident
        @ingredient = Ingredient.find_by_id(params[:id])
    end

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
end