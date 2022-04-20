class ApiController < ApplicationController
    def user_posts
        @user = User.find(params[:user_id])
        @posts = @user.posts

        json_response(@posts)
    end
end 