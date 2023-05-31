class Api::V1::UsersController < ::Api::ApplicationController
  def follow
    target_user = User.find(params[:id])
    relationship = FollowingRecord.new(user_id: current_user.id, followed_id: target_user.id)
    if relationship.save
      render json: { message: "You are now following #{target_user.name}." }
    else
      render json: { message: "relations create fail." }
    end
  end

  def unfollow
    target_user = User.find(params[:id])
    relationship = FollowingRecord.find_by_user_id_and_followed_id(current_user.id, target_user.id)
    if relationship.destroy
      render json: { message: "You have unfollowed #{target_user.name}." }
    else
      render json: { message: "relations delete fail." }
    end
  end
end
