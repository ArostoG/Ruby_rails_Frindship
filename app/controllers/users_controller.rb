class UsersController < ApplicationController
    def main
        render "index"
      end

      def new
        @users = User.create(name:params[:name],alias:params[:alias],email:params[:email],date:params[:date],password:params[:password],password_confirmation:params[:confirm_password])
        if @users.valid?
          redirect_to '/main' 
        else
        flash[:messages] = @users.errors.full_messages 
        redirect_to '/main' 
        end
      end

      def login
           @user = User.find_by(email:params[:email])
        if  @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to '/friends'
        else
            flash[:messages] = ["Please try again you email & password is not matching"]
            redirect_to '/main'
        end

     end

    def user_detail
         @user = User.find_by(id: params[:id])
        render "user_detail_page"
    end

    


    def clear
        @users = User.find(session[:user_id])
        session.clear
        redirect_to '/main'
      end


end
