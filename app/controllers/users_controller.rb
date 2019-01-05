class UsersController < ApplicationController

    def index
        @users = User.all.sort_users
    end

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])

        if session[:user_id] == params[:id].to_i
            @current_user = current_user
            # @user = User.find(session[:user_id])
            # flash[:msg] = ["Welcome, #{@user.name}! Log your feelings for today!"]
        else
        end

    end

    def create
        user = User.new(user_params)
        if user.valid?
            user.save
            redirect_to user
        else
            flash[:errors] = user.errors.full_messages
            redirect_to new_user_path
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        if user.valid?
            redirect_to user
        else
            flash[:errors] = user.errors.full_messages
            redirect_to edit_user_path
        end
    end

    # user_log model --> dependent: :destroy
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to users_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
