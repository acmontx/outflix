class NotificationsController < ApplicationController
  def index
  end

  def update
    if current_user.update(user_params)
      if user_params[:frequency] == "Demo - deliver now"
        if user_params[:medium] == 'Email'
          UserMailer.with(user: current_user).newsletter.deliver_now
        else
          current_user.send_text_message
        end
      end

      redirect_to contents_path
    else
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:medium, :frequency, :phone_number)
  end
end

