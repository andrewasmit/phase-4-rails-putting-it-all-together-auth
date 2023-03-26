class RecipeController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        user = User.find_by(id: session[:user_id])
        if user
            render json: user.recipes, status: :created
        else
            render json: { errors: ["You must log in son"] }, status: :unauthorized
        end
    end

    def create
        user = User.find_by(id: session[:user_id])
        if user
            new_recipe = user.recipes.create!(recipes_params)
            render json: new_recipe, status: :created
        else 
            render json: { errors: ["You must log in son"] }, status: :unauthorized
        end
    end

    private
    def recipes_params
        params.permit(:title, :instructions, :minutes_to_complete, :user_id)
    end

    def render_unprocessable_entity_response e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end
