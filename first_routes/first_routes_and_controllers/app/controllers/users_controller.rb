class UsersController < ApplicationController
    def index
        render json: User.all
        # render plain: "I'm in the index action!"
    end

    def create
        user = User.new(user_params)

        if user.save
            redirect_to user_url(user)
        else
            render json: user.errors.full_messages, status: 422
        end
        # user.save!
        # render json: user

        

        # render json: params
    end

    # def new

    # end 


    def show
        render json: params
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end