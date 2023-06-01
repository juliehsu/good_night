class Api::V1::UsersController < ::Api::ApplicationController
  def follow
    if current_user.id == params[:id].to_i
      render json: { result: 'fail', message: "should not follow yourself, relations create fail." }
    else
      target_user = User.where(id: params[:id]).first
      if target_user.present?
        relationship = FollowingRecord.find_or_create_by(user_id: current_user.id, followed_id: target_user.id)
        if relationship.save
          render json: { result: 'success', message: "You are now following #{target_user.name}." }
        else
          render json: { result: 'fail', message: "relationship create fail." }
        end
      else
        render json: { result: 'fail', message: "user_id you want to follow is not exist." }
      end
    end
  end

  def unfollow
    target_user = User.where(id: params[:id]).first
    if target_user.present?
      relationship = FollowingRecord.find_by_user_id_and_followed_id(current_user.id, target_user.id)
      if relationship.present? && relationship.destroy
        render json: { result: 'success', message: "You have unfollowed #{target_user.name}." }
      else
        render json: { result: 'fail', message: "relationship not exist or relationship delete fail." }
      end
    else
      render json: { result: 'fail', message: "user_id you want to unfollow is not exist." }
    end
  end
end
