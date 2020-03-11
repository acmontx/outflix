class NotificationsController < ApplicationController
  def index
  end

  def update
    if current_user.update(user_params)
      UserMailer.with(user: current_user).newsletter.deliver_now if user_params[:frequency] == "Demo - deliver now"

      redirect_to contents_path
    else
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:medium, :frequency)
  end
end

