# class SessionsController < ApplicationController
#     def new
#     end

#     def create
#         @user = User.find_by(email: params[:email])
        
        
#         #if the user exists and you are who you say you are...
#         if @user && @user.authenticate(params[:password])
#             session[:user_id] = @user.id
#             redirect_to user_path(@user)
#         else
#             flash[:errors] = ["Invalid Email and Password"]
#             redirect_to login_path
#         end
            

#     end
    
#     def destroy

#     end

# end
