class SignupController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    private
    def user_params
        params.permit(:image_url, :username, :password, :password_confirmation, :bio)
    end

    def render_unprocessable_entity_response e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

end
