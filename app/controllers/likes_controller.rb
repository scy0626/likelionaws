class LikesController < ApplicationController
    def likes_toggle
        like = Like.find_by(user_id: current_user.id, post_id: params[:id])
        
        if like.nil?
            Like.create(user_id: current_user.id, post_id: params[:id])
            
            #@likes = Like.new
            #@likes.user_id = current_user
            #@likes.post_id = params[:id]
            #@likes.save
        else
            like.destroy
        end
        
        redirect_to :back
    end
end
