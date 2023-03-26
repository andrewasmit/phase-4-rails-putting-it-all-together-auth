class UserController < ApplicationController

    def show
        user = User.find_by(id: session[:user_id])
        if user
            render json: user, status: :created
        else
            render json: { error:"Not authorized" }, status: :unauthorized
        end
    end

end
