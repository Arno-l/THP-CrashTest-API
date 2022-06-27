
class MembersController < ApplicationController
    before_action :authenticate_user!
  
    def show
      user = get_user_from_token
      render json: {
        message: "If you see this, you're in!",
        user: user
      }
    end

    def edit
      user = get_user_from_token
      user.update(use_params)
      user.save
      render json: {
        message: "User edited !",
        user: user
      }
    end
  
    private
  
    def get_user_from_token
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
      ENV['DEVISE_JWT_SECRET_KEY']).first
      user_id = jwt_payload['sub']
      User.find(user_id.to_s)
    end

    def use_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone)
    end
  end