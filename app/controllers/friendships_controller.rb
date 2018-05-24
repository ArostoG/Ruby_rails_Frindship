class FriendshipsController < ApplicationController

    def show_friends
        @user = User.find_by(id: session[:user_id])
        @user_friend= User.find(session[:user_id]).friends.order(id: :asc)
        # @other_friends=Frindship.where(friend_id:session[:user_id])

       
        @other_users = User.where.not(id:session[:user_id]).where.not(id: @user_friend)
        render "friend_page"
      end

      def join_friends
          @friend = Frindship.create(user_id:session[:user_id],friend_id:params[:id])
          redirect_to '/friends'
      end

      def remove_friends
        @friend = Frindship.find_by(user_id:session[:user_id],friend_id:params[:id])
        @friend.destroy
        redirect_to '/friends'
    end

    def profile_detail
        @user = User.find_by(id: params[:id])
        render "profile_detail_page"
     end

end
