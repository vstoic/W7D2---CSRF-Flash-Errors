class UsersController < ApplicationController

    def index
        @users = User.all
        render :index
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_url
        else
            render json: @user.errors.full_messages, status:unprocessable_entity
        end
    end

    def new
        render :new
    end

    def show
        @user = user.find(params[:id])
        render :show
    end
    
    def edit
        @user = User.find(params[:id])
        render :edit
    end

    def update
        @user = user.find(params[:id])
        if user.update(user_params)
            redirect_to user_url(@user)
        else
            flash[:errors] = @user.errors.full_messages
        end

    end

    def destroy

    end

    def user_params
        params.require(:user).permit(:email, :password)
    end
end